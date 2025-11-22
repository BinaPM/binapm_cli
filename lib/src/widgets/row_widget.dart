import 'package:binapm_cli/src/domain/entities/widget_entity.dart';

final class Row extends Widget {
  const Row({required this.children});

  final List<Widget> children;

  @override
  Element create() => _RowElement(this);
}

final class _RowElement extends Element {
  const _RowElement(this.widget);

  final Row widget;

  @override
  String render() =>
      widget.children.map((child) => child.create().render()).join();
}
