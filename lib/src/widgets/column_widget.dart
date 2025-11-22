import 'package:binapm_cli/src/domain/entities/widget_entity.dart';

final class Column extends Widget {
  const Column({required this.children});

  final List<Widget> children;

  @override
  Element create() => _ColumnElement(this);
}

final class _ColumnElement extends Element {
  const _ColumnElement(this.widget);

  final Column widget;

  @override
  String render() =>
      widget.children.map((child) => child.create().render()).join('\n');
}
