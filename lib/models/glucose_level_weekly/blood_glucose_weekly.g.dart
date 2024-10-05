// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_glucose_weekly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodGlucoseWeeklyImpl _$$BloodGlucoseWeeklyImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodGlucoseWeeklyImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, WeekData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$BloodGlucoseWeeklyImplToJson(
        _$BloodGlucoseWeeklyImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$WeekDataImpl _$$WeekDataImplFromJson(Map<String, dynamic> json) =>
    _$WeekDataImpl(
      avgLevel: (json['avg_level'] as num?)?.toDouble(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$WeekDataImplToJson(_$WeekDataImpl instance) =>
    <String, dynamic>{
      'avg_level': instance.avgLevel,
      'category': instance.category,
    };
