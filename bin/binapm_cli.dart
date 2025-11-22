import 'package:binapm_cli/binapm_cli.dart';

Future<void> main(List<String> args) async {
  final cli = BinaPMCLI();
  await cli.init(args);
}
