// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:team_manager_registration/Constants/Constants.dart';
import 'package:team_manager_registration/Enum/ParticipationStatus.dart';
import 'package:team_manager_registration/dto/EventDto.dart';
import 'package:team_manager_registration/dto/TeamMemberDto.dart';
import 'package:team_manager_registration/dto/UserDto.dart';
import 'package:team_manager_registration/i18n/strings.g.dart';
import 'package:team_manager_registration/services/Http.dart';
import 'package:latlong2/latlong.dart' as lat_lng2;
import 'package:team_manager_registration/ui/widgets/CustomNotification.dart';
import 'package:team_manager_registration/ui/widgets/EventInfoRow.dart';
import 'package:team_manager_registration/ui/widgets/OliButton.dart';
import 'package:team_manager_registration/uitls/DateTimeUtils.dart';
import 'package:team_manager_registration/uitls/LocaleUtils.dart';
import 'package:team_manager_registration/uitls/ValidationUtils.dart';





/// The details screen
class DeleteProfileScreen extends StatefulWidget {
  static const route = "deleteprofilescreen";
  /// Constructs a [EventSignupScreen]


  DeleteProfileScreen({super.key});
  @override
  State<DeleteProfileScreen> createState() => _DeleteProfileScreenState();
}



class _DeleteProfileScreenState extends State<DeleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<void> delete(BuildContext context) async {
    // Validate form before proceeding
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Validate inputs before sending request
    String email = ValidationUtils.sanitizeInput(_emailController.value.text);
    String password = _passwordController.value.text;

    String? emailError = ValidationUtils.getEmailValidationError(email);
    if (emailError != null) {
      CustomNotification.showError(context: context, description: emailError);
      return;
    }

    String? passwordError = ValidationUtils.getPasswordValidationError(password);
    if (passwordError != null) {
      CustomNotification.showError(context: context, description: passwordError);
      return;
    }

    UserDto user = UserDto(email: email, password: password);
    Http http = Http();
    Response response = await http.delete(
        url: Constants.getDeleteUserPath(),
        context: context,
        body: user);

    if (response.statusCode == 200) {
      CustomNotification.showSuccess(context: context, description: "User deletion process has started!");
    }
  }



  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late bool _passwordVisible;


  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,

              child: Form(
                key: _formKey,
                child: Column(children: [
  const Image(
    width: 300,
    image: AssetImage('assets/logo/alone/ALONE.png'),
  ),

  const SizedBox(
    height: 30,
  ),
  Text("By entering your email and password, you will start account deletion process!", style: Constants.cardTitleTextStyle?.copyWith(color: Colors.red),),
  const SizedBox(
    height: 30,
  ),
  TextFormField(
    decoration: InputDecoration(
        hintText: t.user.email,
        prefixIcon: const Icon(CupertinoIcons.envelope)),
    controller: _emailController,
    validator: (value) => ValidationUtils.getEmailValidationError(value ?? ''),
    inputFormatters: [
      FilteringTextInputFormatter.deny(
          RegExp(r'\s')),
      FilteringTextInputFormatter(RegExp("[ ]"), allow: false)
      // BlacklistingTextInputFormatter(RegExp("[ ]"))
    ],
  ),
  const SizedBox(
    height: 15,
  ),
  TextFormField(
    inputFormatters: [
      FilteringTextInputFormatter.deny(
          RegExp(r'\s')),],
    controller: _passwordController,
    validator: (value) => ValidationUtils.getPasswordValidationError(value ?? ''),
    obscureText: !_passwordVisible,
    decoration: InputDecoration(
      hintText: t.authentication.password,
      prefixIcon: const Icon(CupertinoIcons.padlock),
      suffixIcon: IconButton(
        icon: Icon(
          // Based on passwordVisible state choose the icon
          _passwordVisible
              ? Icons.visibility_off
              : Icons.visibility,
        ),
        onPressed: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
      ),
    ),
  ),
  const SizedBox(height: 15,),
  OliButton(
      width: MediaQuery.of(context).size.width * 0.8,
      theme: Theme.of(context).copyWith(
          elevatedButtonTheme:
          Constants.orange1ElevatedButtonTheme),
      textStyle: Constants.primaryButtonTextStyle,
      text: "Delete",
      onPressed: () => delete(context)),
],)),              ),
            ),
          ),
        ),
      ),
    );
  }

}