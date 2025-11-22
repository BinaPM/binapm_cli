import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:binapm_cli/src/constants.dart';
import 'package:binapm_cli/src/domain/entities/widget_entity.dart';
import 'package:binapm_cli/src/repositories/logger_repository.dart';
import 'package:binapm_cli/src/repositories/updater_repository.dart';
import 'package:binapm_cli/src/widgets/column_widget.dart';
import 'package:binapm_cli/src/widgets/row_widget.dart';
import 'package:binapm_cli/src/widgets/spacer_widget.dart';
import 'package:binapm_cli/src/widgets/stateless_widget.dart';
import 'package:binapm_cli/src/widgets/text_widget.dart';

part 'about_widget.dart';

final class AboutCommand extends Command<void> {
  AboutCommand(this._logger, this._updater);

  final LoggerRepository _logger;
  final UpdaterRepository _updater;

  @override
  String get name => 'about';

  @override
  String get description => 'Displays information about the application.';

  @override
  Future<void>? run() async {
    final latest = await _updater.getLatestVersion();
    final hasUpdate = await _updater.checkUpdate(latest);

    _logger.render(
      widget: _AboutWidget(
        hasUpdate: hasUpdate,
        latestVersion: latest,
      ),
    );
  }
}
