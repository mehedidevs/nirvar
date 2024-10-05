import 'package:nirvar/models/patient_blood_pressure/patient_blood_pressure.dart';
class BloodPressureUtils {
  static Map<String, double> calculateAverage(List<PatientBloodPressure> bloodPressureList) {
    if (bloodPressureList.isEmpty) {
      return {'systolic': 0.0, 'diastolic': 0.0};
    }

    final int totalSystolic = bloodPressureList.fold(0, (sum, bp) => sum + (bp.systolic ?? 0));
    final int totalDiastolic = bloodPressureList.fold(0, (sum, bp) => sum + (bp.diastolic ?? 0));


    final double avgSystolic = totalSystolic / bloodPressureList.length;
    final double avgDiastolic = totalDiastolic / bloodPressureList.length;

    return {
      'systolic': avgSystolic,
      'diastolic': avgDiastolic,
    };
  }
}
