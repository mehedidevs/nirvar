class CustomApiErrorResponseHandler implements Exception {
  final dynamic rawMessage;

  CustomApiErrorResponseHandler(this.rawMessage);

  String get userMessage {
    if (rawMessage is String) {
      return rawMessage;
    } else if (rawMessage is Map) {
      // Convert Map to readable string: key: value \n key2: value2
      return rawMessage.entries
          .map((entry) => '${entry.key}: ${entry.value}')
          .join('\n');
    } else {
      return 'Something went wrong. Please try again.';
    }
  }

  @override
  String toString() => userMessage;
}
