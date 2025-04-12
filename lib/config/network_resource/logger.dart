import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(  // Customize the log format
    methodCount: 2,       // Number of method calls to display
    errorMethodCount: 8,  // Number of method calls if stacktrace is provided
    lineLength: 80,       // Width of the output
    colors: true,         // Colorful log messages
    printEmojis: true,    // Print emojis for log levels
    printTime: false,     // Include timestamp in output
  ),
);
