import 'package:nirvar/models/patient_files/patient_file.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';

class SearchResponseData{
  final List<PatientFolder>? folders;
  final List<PatientFile>? files;
  const SearchResponseData({this.folders,this.files});
}