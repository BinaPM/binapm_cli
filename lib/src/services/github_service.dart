import 'package:github/github.dart';

final class GitHubService {
  GitHubService() {
    _gitHub = GitHub(auth: findAuthenticationFromEnvironment());
  }

  late final GitHub _gitHub;

  Future<List<Release>> getReleases(String repository) async {
    final parts = repository.split('/');
    final name = parts.elementAt(parts.length - 1);
    final owner = parts.elementAt(parts.length - 2);

    final slug = RepositorySlug(owner, name);
    final stream = _gitHub.repositories.listReleases(slug);
    return stream.toList();
  }
}
