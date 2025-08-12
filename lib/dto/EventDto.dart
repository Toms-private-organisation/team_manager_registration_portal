

import 'package:team_manager_registration/Enum/EventType.dart';
import 'package:team_manager_registration/dto/TeamDto.dart';
import 'package:team_manager_registration/utils/DateTimeUtils.dart';

import 'ParticipationDto.dart';

class EventDto {
  String? id;
  TeamDto? teamDto;
  DateTime? eventDateTime;
  String? eventName;
  EventTypes? eventType;
  List<ParticipationDto>? participation;
  double? eventPrice;
  bool? dividePayments;
  bool? eventEnded;
  int? maxParticipants;
  int? signedUpParticipants;
  double? lat;
  double? lon;
  String? locationName;
  String? locationAddress;
  bool? signedUp;
  bool? cancelled;
  bool? owner;
  bool? manager;
  String? notes;

  EventDto(
      {this.id,
        this.teamDto,
        this.eventDateTime,
        this.eventName,
        this.participation,
        this.eventPrice,
        this.dividePayments,
        this.maxParticipants,
        this.signedUpParticipants,
        this.eventType,
        this.lat,
        this.lon,
        this.locationAddress,
        this.locationName,
        this.signedUp,
        this.owner,
        this.manager,
        this.eventEnded,
        this.cancelled,
        this.notes
      });

  factory EventDto.fromJson(Map json) {
    return EventDto(
        id: json["id"],
        eventDateTime: DateTime.parse(json["eventDateTime"]),
        eventName: json["eventName"],
        // participation: List<ParticipationDto>.from(json['participation']
        //     .map((model) => ParticipationDto.fromJson(model))),
        eventPrice: json["eventPrice"],
        dividePayments: json["dividePayments"],
        maxParticipants: json["maxParticipants"],
        signedUpParticipants: json["signedUpParticipants"],
        eventType: json["eventType"] != null ? EventTypes.fromString(json["eventType"]) : null,
        lat: json["lat"],
        lon: json["lon"],
        locationAddress: json["locationAddress"],
        locationName: json["locationName"],
        signedUp: json["signedUp"],
        owner: json['owner'],
        manager: json['manager'],
        eventEnded: json['eventEnded'],
        cancelled: json['cancelled'],
      notes: json['notes']
    );
  }



  static List<EventDto> fromJsonList(List json) {
    return json.map((e) => EventDto.fromJson(e as Map)).toList();
  }

}
