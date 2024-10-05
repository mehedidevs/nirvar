// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glucose_level_for_past_seven_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlucoseLevelForPastSevenDaysImpl _$$GlucoseLevelForPastSevenDaysImplFromJson(
        Map<String, dynamic> json) =>
    _$GlucoseLevelForPastSevenDaysImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, GlucoseValues.fromJson(e as Map<String, dynamic>)),
      ),
      avgLevel: json['avg_level'] as String?,
    );

Map<String, dynamic> _$$GlucoseLevelForPastSevenDaysImplToJson(
        _$GlucoseLevelForPastSevenDaysImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'avg_level': instance.avgLevel,
    };

_$GlucoseValuesImpl _$$GlucoseValuesImplFromJson(Map<String, dynamic> json) =>
    _$GlucoseValuesImpl(
      valueOne: (json['value_one'] as num?)?.toDouble(),
      valueTwo: (json['value_two'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$GlucoseValuesImplToJson(_$GlucoseValuesImpl instance) =>
    <String, dynamic>{
      'value_one': instance.valueOne,
      'value_two': instance.valueTwo,
    };
