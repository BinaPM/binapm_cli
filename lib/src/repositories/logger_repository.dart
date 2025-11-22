import 'package:binapm_cli/src/domain/entities/widget_entity.dart';
import 'package:binapm_cli/src/domain/enums/logger_style_enum.dart';
import 'package:binapm_cli/src/services/logger_service.dart';

abstract class LoggerRepository {
  const LoggerRepository();

  void print(
    String message, {
    LoggerStyle style = .info,
  });

  void prompt(
    String message, {
    bool hidden = false,
    String? defaultValue,
  });

  void render({required Widget widget});
}

final class LoggerRepositoryImpl extends LoggerRepository {
  const LoggerRepositoryImpl(this._logger);

  final MasonLoggerService _logger;

  @override
  void print(
    String message, {
    LoggerStyle style = .info,
  }) {
    switch (style) {
      case .info:
        _logger.info(message);
      case .alert:
        _logger.alert(message);
      case .error:
        _logger.err(message);
      case .success:
        _logger.success(message);
      case .warning:
        _logger.warn(message);
      case .detail:
        _logger.detail(message);
    }
  }

  @override
  void prompt(
    String message, {
    bool hidden = false,
    String? defaultValue,
  }) {
    _logger.prompt(
      message,
      hidden: hidden,
      defaultValue: defaultValue,
    );
  }

  @override
  void render({
    required Widget widget,
  }) => _logger.info(widget.create().render());
}
