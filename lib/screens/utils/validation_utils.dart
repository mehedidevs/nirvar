class ValidationUtils {
  /// Validates if the given value is not null or empty.
  static String? validateRequiredField(String? value, {required String fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your $fieldName';
    }
    return null;
  }

  /// Validates a required email field.
  /// Ensures the field is not empty and matches a basic email pattern.
  static String? requiredEmailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    const String emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
    if (!RegExp(emailPattern).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates an optional email field.
  /// Ensures the field matches a basic email pattern if not empty.
  static String? optionalEmailValidation(String? value) {
    if (value != null && value.isNotEmpty) {
      const String emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
      if (!RegExp(emailPattern).hasMatch(value)) {
        return 'Please enter a valid email address';
      }
    }
    return null;
  }

  /// Validates an optional weight field.
  /// Ensures the field contains a positive numeric value if not empty.
  static String? optionalWeightValidation(String? value) {
    if (value != null && value.isNotEmpty) {
      final double? weight = double.tryParse(value);
      if (weight == null || weight <= 0) {
        return 'Please enter a valid weight (greater than 0)';
      }
    }
    return null;
  }

  /// Validates an optional height in feet.
  /// Ensures the feet value is between 4 and 9 if provided.
  static String? optionalHeightFeetValidation(String? value) {
    if (value != null && value.isNotEmpty) {
      final int? feet = int.tryParse(value);
      if (feet == null || feet < 4 || feet > 9) {
        return 'Please enter a valid height in feet (between 4 and 9).';
      }
    }
    return null;
  }

  /// Validates an optional height in inches.
  /// Ensures the inches value is between 0 and 11 if provided.
  static String? optionalHeightInchesValidation(String? value) {
    if (value != null && value.isNotEmpty) {
      final int? inches = int.tryParse(value);
      if (inches == null || inches < 0 || inches > 11) {
        return 'Please enter a valid height in inches (between 0 and 11).';
      }
    }
    return null;
  }

  /// Validates if the given value is a valid phone number.
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number (10 digits)';
    }
    return null;
  }

  /// Validates if the given value meets a minimum length requirement.
  static String? validateMinLength(String? value, int minLength, {required String fieldName}) {
    if (value == null || value.trim().length < minLength) {
      return '$fieldName must be at least $minLength characters long';
    }
    return null;
  }

  /// Validates if the given value matches a custom regex pattern.
  static String? validateWithRegex(String? value, RegExp pattern, {required String errorMessage}) {
    if (value == null || !pattern.hasMatch(value.trim())) {
      return errorMessage;
    }
    return null;
  }
}
