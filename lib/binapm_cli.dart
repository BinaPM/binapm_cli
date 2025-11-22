/// A project and workspace manager for various technologies and IDEs.
library;

import 'package:args/command_runner.dart';
import 'package:binapm_cli/src/commands/about/about_command.dart';
import 'package:binapm_cli/src/constants.dart';
import 'package:binapm_cli/src/repositories/logger_repository.dart';
import 'package:binapm_cli/src/repositories/updater_repository.dart';
import 'package:binapm_cli/src/services/github_service.dart';
import 'package:binapm_cli/src/services/logger_service.dart';

final class BinaPMCLI {
  BinaPMCLI() {
    _runner = CommandRunner<void>('bina', Constants.description);
  }

  late final CommandRunner<void> _runner;

  Future<void> init(List<String> args) async {
    _register();
    await _runner.run(args);
  }

  void _register() {
    final updater = UpdaterRepositoryImpl(GitHubService());
    final logger = LoggerRepositoryImpl(MasonLoggerService());

    _runner.addCommand(AboutCommand(logger, updater));
  }
}
