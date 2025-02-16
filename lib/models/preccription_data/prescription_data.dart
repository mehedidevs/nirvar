import 'package:nirvar/models/patient_files/patient_file.dart';

class PrescriptionData {
  final List<PatientFile>? prescriptions;
  final List<PatientFile>? testReports;
  const PrescriptionData({ this.prescriptions,this.testReports});
}