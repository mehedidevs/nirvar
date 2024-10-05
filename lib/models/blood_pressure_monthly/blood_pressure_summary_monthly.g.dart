// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_summary_monthly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodPressureSummaryMonthlyImpl _$$BloodPressureSummaryMonthlyImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodPressureSummaryMonthlyImpl(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, BloodPressureMonth.fromJson(e as Map<String, dynamic>)),
      ),
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$BloodPressureSummaryMonthlyImplToJson(
        _$BloodPressureSummaryMonthlyImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

_$BloodPressureMonthImpl _$$BloodPressureMonthImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodPressureMonthImpl(
      avgSystolic: json['avg_systolic'] as String?,
      avgDiastolic: json['avg_diastolic'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$BloodPressureMonthImplToJson(
        _$BloodPressureMonthImpl instance) =>
    <String, dynamic>{
      'avg_systolic': instance.avgSystolic,
      'avg_diastolic': instance.avgDiastolic,
      'category': instance.category,
    };
