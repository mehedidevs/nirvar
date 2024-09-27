enum FileType {
  prescription,
  testReport,
}

extension FileTypeExtension on FileType {
  String get value {
    switch (this) {
      case FileType.prescription:
        return 'prescription';
      case FileType.testReport:
        return 'test-report';
    }
  }
}
