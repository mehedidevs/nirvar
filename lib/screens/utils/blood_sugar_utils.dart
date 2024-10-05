import 'package:nirvar/models/patient_glucose/patient_glucose.dart';

class BloodSugarUtils{

  static Map<String, double> calculateAverage(List<PatientGlucose> bloodGlucoseList) {
    if (bloodGlucoseList.isEmpty) {
      return {'sugar_level': 0.0};
    }
    final int totalGlucoseLevel = bloodGlucoseList.fold(0, (sum, sugar) => sum + (sugar.bloodSugarLevel ?? 0));
    final double avgBloodGlucose = totalGlucoseLevel / bloodGlucoseList.length;
    return {'sugar_level': avgBloodGlucose};
  }

}