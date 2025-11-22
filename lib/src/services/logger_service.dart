import 'package:mason_logger/mason_logger.dart';

final class MasonLoggerService {
  MasonLoggerService() {
    _logger = Logger();
  }

  late final Logger _logger;

  void info(String message) => _logger.info(message);

  void alert(String message) => _logger.alert(message);

  void err(String message) => _logger.err(message);

  void success(String message) => _logger.success(message);

  void warn(String message) => _logger.warn(message);

  void detail(String message) => _logger.detail(message);

  bool confirm(
    String message, {
    bool defaultValue = false,
  }) => _logger.confirm(
    message,
    defaultValue: defaultValue,
  );

  String prompt(
    String message, {
    bool hidden = false,
    String? defaultValue,
  }) => _logger.prompt(
    message,
    hidden: hidden,
    defaultValue: defaultValue,
  );

  List<String> promptAny(
    String message, {
    String separator = ',',
  }) => _logger.promptAny(
    message,
    separator: separator,
  );

  String chooseOne(
    String message, {
    required List<String> choices,
    String? defaultValue,
  }) => _logger.chooseOne<String>(
    message,
    choices: choices,
    defaultValue: defaultValue,
  );

  List<String> chooseAny(
    String message, {
    required List<String> choices,
    List<String>? defaultValues,
  }) => _logger.chooseAny<String>(
    message,
    choices: choices,
    defaultValues: defaultValues,
  );
}
