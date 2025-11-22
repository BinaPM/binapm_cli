import 'package:binapm_cli/src/constants.dart';
import 'package:binapm_cli/src/services/github_service.dart';

abstract class UpdaterRepository {
  const UpdaterRepository();

  Future<String> getLatestVersion();
  Future<bool> checkUpdate(String? version);
}

final class UpdaterRepositoryImpl implements UpdaterRepository {
  const UpdaterRepositoryImpl(this._github);

  final GitHubService _github;

  @override
  Future<String> getLatestVersion() async {
    final releases = await _github.getReleases(Constants.repository);

    final String version;
    if (releases.isEmpty || releases.first.tagName == null) {
      version = Constants.version;
    } else {
      version = releases.first.tagName!.replaceAll('v', '');
    }

    return version;
  }

  @override
  Future<bool> checkUpdate(String? version) async {
    final latest = version ?? await getLatestVersion();
    return latest.compareTo(Constants.version) > 0;
  }
}
