import 'package:binapm_cli/src/domain/entities/widget_entity.dart';

abstract class StatelessWidget extends Widget {
  const StatelessWidget();

  Widget build();

  @override
  Element create() => _StatelessElement(this);
}

final class _StatelessElement extends Element {
  const _StatelessElement(this.widget);

  final StatelessWidget widget;

  @override
  String render() => widget.build().create().render();
}
