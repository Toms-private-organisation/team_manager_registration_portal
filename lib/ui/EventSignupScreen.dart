// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:team_manager_registration/Constants/Constants.dart';
import 'package:team_manager_registration/Enum/ParticipationStatus.dart';
import 'package:team_manager_registration/dto/EventDto.dart';
import 'package:team_manager_registration/dto/TeamMemberDto.dart';
import 'package:team_manager_registration/i18n/strings.g.dart';
import 'package:team_manager_registration/services/Http.dart';
import 'package:latlong2/latlong.dart' as lat_lng2;
import 'package:team_manager_registration/ui/widgets/CustomNotification.dart';
import 'package:team_manager_registration/ui/widgets/EventInfoRow.dart';
import 'package:team_manager_registration/ui/widgets/OliButton.dart';
import 'package:team_manager_registration/utils/DateTimeUtils.dart';
import 'package:team_manager_registration/utils/LocaleUtils.dart';

/// The details screen
class EventSignupScreen extends StatefulWidget {
  static const route = "eventScreen";

  /// Constructs a [EventSignupScreen]
  String id;

  EventSignupScreen({super.key, required this.id});

  @override
  State<EventSignupScreen> createState() => _EventSignupScreenState();
}

class _EventSignupScreenState extends State<EventSignupScreen> {
  int _selectedItemIndex = -1;
  late Future<EventDto> _eventFuture;
  late Future<List<TeamMemberDto>> _teamMemberFuture;
  List<TeamMemberDto> teamMemberSnapshot = [];
  bool _canSignUp = false;

  Future<void> refreshPage(BuildContext context) async {
    _teamMemberFuture = getUnregisteredPlayers();
    _eventFuture = getEvent(context);
  }

  void registerUserInLocalStorage(TeamMemberDto tm) async {
    var box = await Hive.openBox('signupBox');
    if (box.get(widget.id) == null && !tm.selected) {
      setState(() {
        box.put(widget.id, tm.id);
        // refreshPage(context);
      });
    }
  }

  Future<void> signUpOpen(List<TeamMemberDto> teamMemberDto) async {
    var box = await Hive.openBox('signupBox');
    Map<String, TeamMemberDto> teamMemberDtoMap = {
      for (var tm in teamMemberDto) tm.id!: tm
    };
    setState(() {
      _canSignUp = box.get(widget.id) == null ||
          teamMemberDtoMap[box.get(widget.id)]?.participationStatus !=
              ParticipationStatus.REGISTERED;
    });
  }

  bool canSignUp(TeamMemberDto teamMemberDto) {
    return teamMemberDto.participationStatus !=
            ParticipationStatus.REGISTERED ||
        teamMemberDto.selected;
  }

  Future<List<TeamMemberDto>> getUnregisteredPlayers() async {
    Http http = Http();
    Response response = await http.get(
        url: Constants.getUnregisteredTeamMembersPath(),
        context: context,
        body: {"eventId": widget.id});

    if (response.statusCode == 200) {
      List<TeamMemberDto> teamMembers =
          TeamMemberDto.fromJsonList(response.data);
      _teamMemberFuture.then((data) {
        setState(() {
          teamMemberSnapshot = data;
        });
      });
      // teamMemberSnapshot = eventDto;
      // editedTeamMemberSnapshot = eventDto;
      signUpOpen(teamMembers);
      if (context.mounted) {
        setState(() {});
      }
      return teamMembers;
    }

    if (context.mounted) {
      setState(() {});
      // Provider.of<AuthModel>(context, listen: false)
      //     .setViewState(ViewState.Ideal);
    }
    return <TeamMemberDto>[];
  }

  Future<EventDto> getEvent(BuildContext context) async {
    Http http = Http();
    Response response = await http.get(
        url: Constants.getEventByIdPath(),
        context: context,
        body: {"id": widget.id});

    if (response.statusCode == 200) {
      EventDto eventDto = EventDto.fromJson(response.data);
      return eventDto;
    }
    return EventDto();
  }

  Future<void> signUp() async {
    Http http = Http();
    Response response = await http.postWithQuerryParameters(
        url: Constants.getSignUpForEventPath(),
        context: context,
        body: {
          "eventId": widget.id,
          "playerId": teamMemberSnapshot[_selectedItemIndex].id
        });
    if (response.statusCode == 200) {
      registerUserInLocalStorage(teamMemberSnapshot[_selectedItemIndex]);
      setState(() {
        _selectedItemIndex = -1;
      });
      if (mounted) {
        CustomNotification.showSuccess(
            context: context, description: t.events.signedUp);
        refreshPage(context);
      }
    }
  }

  @override
  void initState() {
    refreshPage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _selectedItemIndex >= 0
            ? OliButton(
                width: MediaQuery.sizeOf(context).width * 0.8,
                textStyle: const TextStyle(color: Colors.white),
                text: "Sign up",
                onPressed: () => signUp())
            : const SizedBox.shrink(),
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
                child: FutureBuilder<EventDto?>(
                  future: _eventFuture,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Center(child: Text(t.misc.dataNotFound));
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              snapshot.data!.lat != 0.0 &&
                                      snapshot.data!.lon != 0.0
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: SizedBox(
                                          height: 250,
                                          child: FlutterMap(
                                            options: MapOptions(
                                              interactiveFlags:
                                                  InteractiveFlag.pinchZoom |
                                                      InteractiveFlag.drag,
                                              center: lat_lng2.LatLng(
                                                  snapshot.data!.lat!,
                                                  snapshot.data!.lon!),
                                              zoom: 15,
                                            ),
                                            children: [
                                              TileLayer(
                                                urlTemplate:
                                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                userAgentPackageName:
                                                    'com.example.app',
                                              ),
                                              MarkerLayer(
                                                markers: [
                                                  Marker(
                                                      point: lat_lng2.LatLng(
                                                          snapshot.data!.lat!,
                                                          snapshot.data!.lon!),
                                                      width:
                                                          Constants.markerSize,
                                                      height:
                                                          Constants.markerSize,
                                                      child: SvgPicture.asset(
                                                        "assets/svg/marker.svg",
                                                        color: Constants
                                                            .primaryColor,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              getEventFields(snapshot, context),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: FutureBuilder<List<TeamMemberDto>>(
                                  future: _teamMemberFuture,
                                  builder: (context, snapshot2) {
                                    switch (snapshot2.connectionState) {
                                      case ConnectionState.waiting:
                                        return Center(
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.blue)),
                                                height: 100,
                                                width: 100,
                                                child:
                                                    const CircularProgressIndicator()));
                                      default:
                                        if (snapshot.hasError) {
                                          return Center(
                                              child: Text(t.misc.dataNotFound));
                                        } else {
                                          return snapshot2.data!.isEmpty
                                              ? const Center(
                                                  child: Text(
                                                      "There is nobody to sign up!"),
                                                )
                                              : Column(
                                                  children: [
                                                    snapshot.data!.cancelled!
                                                        ? Text(
                                                            t.events
                                                                .eventCancelled,
                                                            style: Constants
                                                                .titleMediumTextStyle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .red),
                                                          )
                                                        : Container(),
                                                    snapshot.data!.eventEnded!
                                                        ? Text(
                                                            t.events.eventEnded,
                                                            style: Constants
                                                                .titleMediumTextStyle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .red),
                                                          )
                                                        : Container(),
                                                    !_canSignUp &&
                                                            snapshot2.data !=
                                                                null
                                                        ? Text(
                                                            t.events
                                                                .alreadySignedUp,
                                                            style: Constants
                                                                .errorSmallTextStyle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .red),
                                                          )
                                                        : Container(),
                                                    Text(
                                                      "Team Members",
                                                      style: Constants
                                                          .titleMediumTextStyle,
                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            teamMemberSnapshot
                                                                .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          TeamMemberDto
                                                              teamMember =
                                                              teamMemberSnapshot[
                                                                  index];
                                                          return CheckboxListTile(
                                                            checkColor: Colors.white,
                                                            side: const BorderSide(width: 2, color: Constants.primaryColor),
                                                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                                                  (Set<MaterialState> states) {
                                                                if (states.contains(MaterialState.selected)) {
                                                                  // If the checkbox is selected, use a specific color.
                                                                  return Constants.primaryColor; // Replace with any color you prefer.
                                                                } else if (states.contains(MaterialState.disabled)) {
                                                                  // If the checkbox is disabled, use a different color.
                                                                  return Colors.grey;
                                                                }
                                                                // Default color when not selected or disabled.
                                                                return Colors.white;
                                                              },
                                                            ),
                                                            enabled: !snapshot.data!.eventEnded! &&
                                                                teamMemberSnapshot[index].participationStatus !=
                                                                    ParticipationStatus.REGISTERED &&
                                                                _canSignUp,
                                                            value: _selectedItemIndex == index ||
                                                                teamMemberSnapshot[index].participationStatus ==
                                                                    ParticipationStatus.REGISTERED,
                                                            onChanged: (bool? value) {
                                                              setState(() {
                                                                if (value != null && value) {
                                                                  _selectedItemIndex = index;
                                                                  // Handle selection logic here
                                                                } else {
                                                                  _selectedItemIndex = -1; // Unselect the item if it was already selected
                                                                }
                                                              });
                                                            },
                                                            title: Text(
                                                              "${teamMember.name} ${teamMember.lastName}" ?? " ",
                                                              overflow: TextOverflow.fade,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                        }
                                    }
                                  },
                                ),
                              ),
                            ],
                          );
                        }
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getEventFields(
      AsyncSnapshot<EventDto?> snapshot, BuildContext context) {
    return Column(
      children: [
        Text(
          t.misc.details,
          style: Constants.cardTitleTextStyle,
        ),
        EventInfoRow(
          text: snapshot.data!.eventName!,
          icon: FontAwesomeIcons.info,
        ),
        EventInfoRow(
          text: snapshot.data!.eventType!.label,
          icon: FontAwesomeIcons.bolt,
        ),
        EventInfoRow(
          text: DateTimeUtils.humanReadableTimeString(
              snapshot.data!.eventDateTime!),
          icon: FontAwesomeIcons.clock,
        ),
        EventInfoRow(
          text: DateTimeUtils.humanReadableLongDateString(
              snapshot.data!.eventDateTime!),
          icon: FontAwesomeIcons.calendar,
        ),
        EventInfoRow(
          text: "${snapshot.data!.eventPrice} ${LocaleUtils.currency(context)}",
          icon: FontAwesomeIcons.moneyBill,
        ),
        snapshot.data!.locationAddress != null ||
                snapshot.data!.locationName != null
            ? EventInfoRow(
                text: snapshot.data?.locationAddress ??
                    snapshot.data!.locationName!,
                icon: FontAwesomeIcons.locationPin,
              )
            : const SizedBox.shrink(),
        (snapshot.data!.notes?.isNotEmpty ?? false)
            ? EventInfoRow(
                text: snapshot.data!.notes!,
                icon: FontAwesomeIcons.comment,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
