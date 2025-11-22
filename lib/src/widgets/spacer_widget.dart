import 'package:binapm_cli/src/domain/entities/widget_entity.dart';

final class Spacer extends Widget {
  const Spacer();

  @override
  Element create() => _SpacerElement(this);
}

final class _SpacerElement extends Element {
  const _SpacerElement(this.widget);

  final Spacer widget;

  @override
  String render() => '';
}
