part of 'version_command.dart';

final class _VersionWidget extends StatelessWidget {
  const _VersionWidget({
    required this.hasUpdate,
    required this.latestVersion,
  });

  final bool hasUpdate;
  final String latestVersion;

  @override
  Widget build() {
    return Column(
      children: [
        const Text('BinaPM CLI', color: .green, style: .bold),
        const Text(Constants.description),
        const Spacer(),
        Row(
          children: [
            const Text('@Latest: ', style: .bold),
            Text(latestVersion),
          ],
        ),
        const Row(
          children: [
            Text('@Current: ', style: .bold),
            Text(Constants.version),
          ],
        ),
        if (hasUpdate) const Spacer(),
        if (hasUpdate)
          const Text(
            'A new version is available! Please update to the latest version.',
            color: .yellow,
          ),
      ],
    );
  }
}
