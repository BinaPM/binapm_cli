part of 'about_command.dart';

final class _AboutWidget extends StatelessWidget {
  const _AboutWidget({
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
        const Row(
          children: [
            Text('@License: ', style: .bold),
            Text(Constants.license),
          ],
        ),
        const Row(
          children: [
            Text('@Package: ', style: .bold),
            Text(Constants.package),
          ],
        ),
        Row(
          children: [
            const Text('@Version: ', style: .bold),
            Text('${Constants.version} (latest: $latestVersion)'),
          ],
        ),
        const Spacer(),
        const Row(
          children: [
            Text('@Business: ', style: .bold),
            Text(Constants.business),
          ],
        ),
        const Row(
          children: [
            Text('@Website: ', style: .bold),
            Text(Constants.website),
          ],
        ),
        const Row(
          children: [
            Text('@GitHub: ', style: .bold),
            Text(Constants.repository),
          ],
        ),
        const Row(
          children: [
            Text('@Author: ', style: .bold),
            Text(Constants.author),
          ],
        ),
        const Spacer(),
        const Text('Thank you for using BinaPM CLI!'),
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
