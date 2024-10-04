// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_history_for_last_7_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodPressureHistoryForLast7DaysImpl
    _$$BloodPressureHistoryForLast7DaysImplFromJson(
            Map<String, dynamic> json) =>
        _$BloodPressureHistoryForLast7DaysImpl(
          status: (json['status'] as num?)?.toInt(),
          message: json['message'] as String?,
          data: (json['data'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, BloodPressureSummary.fromJson(e as Map<String, dynamic>)),
          ),
          avgSystolic: (json['avg_systolic'] as num?)?.toInt(),
          avgDiastolic: (json['avg_diastolic'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$BloodPressureHistoryForLast7DaysImplToJson(
        _$BloodPressureHistoryForLast7DaysImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'avg_systolic': instance.avgSystolic,
      'avg_diastolic': instance.avgDiastolic,
    };

_$BloodPressureSummaryImpl _$$BloodPressureSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodPressureSummaryImpl(
      systolicAvg: (json['systolic_avg'] as num?)?.toInt(),
      diastolicAvg: (json['diastolic_avg'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$BloodPressureSummaryImplToJson(
        _$BloodPressureSummaryImpl instance) =>
    <String, dynamic>{
      'systolic_avg': instance.systolicAvg,
      'diastolic_avg': instance.diastolicAvg,
      'category': instance.category,
    };
