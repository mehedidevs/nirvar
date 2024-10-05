// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_glucose_monthly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodGlucoseMonthlyImpl _$$BloodGlucoseMonthlyImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodGlucoseMonthlyImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, MonthData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$BloodGlucoseMonthlyImplToJson(
        _$BloodGlucoseMonthlyImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$MonthDataImpl _$$MonthDataImplFromJson(Map<String, dynamic> json) =>
    _$MonthDataImpl(
      avgLevel: (json['avg_level'] as num?)?.toDouble(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$MonthDataImplToJson(_$MonthDataImpl instance) =>
    <String, dynamic>{
      'avg_level': instance.avgLevel,
      'category': instance.category,
    };
