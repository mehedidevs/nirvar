// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_summary_weekly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodPressureSummaryWeeklyImpl _$$BloodPressureSummaryWeeklyImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodPressureSummaryWeeklyImpl(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, BloodPressureWeek.fromJson(e as Map<String, dynamic>)),
      ),
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$BloodPressureSummaryWeeklyImplToJson(
        _$BloodPressureSummaryWeeklyImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

_$BloodPressureWeekImpl _$$BloodPressureWeekImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodPressureWeekImpl(
      avgSystolic: json['avg_systolic'] as String?,
      avgDiastolic: json['avg_diastolic'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$BloodPressureWeekImplToJson(
        _$BloodPressureWeekImpl instance) =>
    <String, dynamic>{
      'avg_systolic': instance.avgSystolic,
      'avg_diastolic': instance.avgDiastolic,
      'category': instance.category,
    };
