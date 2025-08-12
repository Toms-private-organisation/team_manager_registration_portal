import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:team_manager_registration/Constants/Constants.dart';
import 'package:team_manager_registration/ui/widgets/CustomNotification.dart';
import 'package:team_manager_registration/utils/ValidationUtils.dart';

import '../i18n/strings.g.dart';

class Http {
  late final Dio api;

  Http(){
    api = Dio();
    // Add security headers and timeouts
    api.options.connectTimeout = const Duration(seconds: 30);
    api.options.receiveTimeout = const Duration(seconds: 30);
    api.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  /// Sanitizes query parameters to prevent injection attacks
  Map<String, dynamic>? _sanitizeQueryParams(Map<String, dynamic>? params) {
    if (params == null) return null;
    
    Map<String, dynamic> sanitized = {};
    params.forEach((key, value) {
      if (value is String) {
        sanitized[key] = ValidationUtils.sanitizeInput(value);
      } else {
        sanitized[key] = value;
      }
    });
    return sanitized;
  }

  Future<dynamic> get({required url, body, required context, Options? options}) async {
    Response response;
    Response? errorResponse;
    try {
      // Sanitize query parameters
      Map<String, dynamic>? sanitizedParams = _sanitizeQueryParams(body);
      response = await api.get(Constants.api + url, queryParameters: sanitizedParams, options: options);
      return response;
    }
    on DioError catch (e) {
      errorResponse = e.response;
      // Removed sensitive logging: print(e);
      try {
        //This gets called in case of error thrown from firebase
        String errorMessage = jsonDecode(
            jsonDecode(errorResponse.toString())["message"])["error"]["message"]
            .toString();
        CustomNotification.showError(context: context,
            description: errorMessage);
        return errorResponse;
      } on FormatException catch (e) {
        //This gets called in case of error thrown from spring boot
        CustomNotification.showError(context: context,
            description: jsonDecode(errorResponse.toString())["message"].toString());
        return errorResponse;
      }
      catch (e) {
        CustomNotification.showError(context: context,
            tDescription: t.errors.tryAgain);
      }
    }
  }

  Future<dynamic> putWithParams({required url, body, required context}) async {
    Response response;
    Response? errorResponse;
    try {
      // Sanitize query parameters
      Map<String, dynamic>? sanitizedParams = _sanitizeQueryParams(body);
      response = await api.put(Constants.api + url, queryParameters: sanitizedParams);
      return response;
    }
    on DioError catch (e) {
      errorResponse = e.response;
      try {
        //This gets called in case of error thrown from firebase
        String errorMessage = jsonDecode(
            jsonDecode(errorResponse.toString())["message"])["error"]["message"]
            .toString();
        CustomNotification.showError(context: context,
            description: errorMessage);
        return errorResponse;
      } on FormatException catch (e) {
        //This gets called in case of error thrown from spring boot
        CustomNotification.showError(context: context,
            description: jsonDecode(errorResponse.toString())["message"].toString());
        return errorResponse;
      }
      catch (e) {
        CustomNotification.showError(context: context,
            tDescription: t.errors.tryAgain);
      }
    }
  }

  Future<dynamic> putWithBody({required url, body, required context}) async {
    Response response;
    Response? errorResponse;
    try {
      response = await api.put(Constants.api + url, data: body);
      return response;
    }
    on DioError catch (e) {
      // Removed sensitive logging: print(e);
      errorResponse = e.response;
      try {
        //This gets called in case of error thrown from firebase
        String errorMessage = jsonDecode(
            jsonDecode(errorResponse.toString())["message"])["error"]["message"]
            .toString();
        CustomNotification.showError(context: context,
            description: errorMessage);
        return errorResponse;
      } on FormatException catch (e) {
        // Removed sensitive logging: print(e);
        //This gets called in case of error thrown from spring boot
        CustomNotification.showError(context: context,
            description: jsonDecode(errorResponse.toString())["message"].toString());
        return errorResponse;
      }
      catch (e) {
        // Removed sensitive logging: print(e);
        CustomNotification.showError(context: context,
            tDescription: t.errors.tryAgain);
      }
    }
  }


  Future<dynamic> delete({required url, body, required context}) async {
    Response response;
    Response? errorResponse;
    try {
      response = await api.delete(Constants.api + url, data: body);
      return response;
    }
    on DioError catch (e) {
      // Removed sensitive logging: print(e);
      errorResponse = e.response;
      try {
        //This gets called in case of error thrown from firebase
        String errorMessage = jsonDecode(
            jsonDecode(errorResponse.toString())["message"])["error"]["message"]
            .toString();
        CustomNotification.showError(context: context,
            description: errorMessage);
        return errorResponse;
      } on FormatException catch (e) {
        // Removed sensitive logging: print(e);
        //This gets called in case of error thrown from spring boot
        CustomNotification.showError(context: context,
            description: jsonDecode(errorResponse.toString())["message"].toString());
        return errorResponse;
      }
      catch (e) {
        CustomNotification.showError(context: context,
            tDescription: t.errors.tryAgain);
      }
    }
  }

  postWithQuerryParameters({url, body, required context}) async {
    Response response;
    Response? errorResponse;
    try {
      // Sanitize query parameters  
      Map<String, dynamic>? sanitizedParams = _sanitizeQueryParams(body);
      response = await api.post(Constants.api + url, queryParameters: sanitizedParams);
      return response;
    }
    on DioError catch (e) {
      errorResponse = e.response;
      try {
        //This gets called in case of error thrown from firebase
        String errorMessage = jsonDecode(
            jsonDecode(errorResponse.toString())["message"])["error"]["message"]
            .toString();
        CustomNotification.showError(context: context,
            description: errorMessage);
        return errorResponse;
      } on FormatException catch (e) {
        // Removed sensitive logging: print(jsonDecode(errorResponse.toString())["message"]);
        //This gets called in case of error thrown from spring boot
        CustomNotification.showError(context: context,
            description: jsonDecode(errorResponse.toString())["message"]);
        return errorResponse;
      }
      catch (e) {
        // Removed sensitive logging: print(e);
        CustomNotification.showError(context: context,
            tDescription: t.errors.tryAgain);
      }
    }
  }

  postWithBody({required url, body, required context}) async {
    Response response;
    Response? errorResponse;
    try {
      response = await api.post(Constants.api + url, data: body);
      return response;
    }
    on DioError catch (e) {
      errorResponse = e.response;
      try {

        //This gets called in case of error thrown from firebase
        String errorMessage = jsonDecode(
            jsonDecode(errorResponse.toString())["message"])["error"]["message"]
            .toString();
        CustomNotification.showError(context: context,
            description: errorMessage);
        return errorResponse;
      } on FormatException catch (e) {
        // Removed sensitive logging: print(e);
        //This gets called in case of error thrown from spring boot
        // Removed sensitive logging: print(errorResponse.toString());
        CustomNotification.showError(context: context,
            description: jsonDecode(errorResponse.toString())["message"]);
        return errorResponse;
      }
      catch (e) {
        // Removed sensitive logging: print(e);
        CustomNotification.showError(context: context,
            tDescription: t.errors.tryAgain);
      }
    }
  }
}