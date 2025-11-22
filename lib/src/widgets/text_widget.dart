import 'package:binapm_cli/src/domain/entities/widget_entity.dart';
import 'package:binapm_cli/src/domain/enums/text_color_enum.dart';
import 'package:binapm_cli/src/domain/enums/text_style_enum.dart';
import 'package:io/ansi.dart';

final class Text extends Widget {
  const Text(
    this.text, {
    this.color = .normal,
    this.style = .normal,
  });

  final String text;
  final TextColor color;
  final TextStyle style;

  @override
  Element create() => _TextElement(this);
}

final class _TextElement extends Element {
  const _TextElement(this.widget);

  final Text widget;

  @override
  String render() => _applyStyle(_applyColor(widget.text));

  String _applyStyle(String text) => switch (widget.style) {
    .normal => text,
    .bold => styleBold.wrap(text)!,
    .italic => styleItalic.wrap(text)!,
    .underline => styleUnderlined.wrap(text)!,
    .strikethrough => styleCrossedOut.wrap(text)!,
  };

  String _applyColor(String text) => switch (widget.color) {
    .normal => text,
    .red => red.wrap(text)!,
    .green => green.wrap(text)!,
    .yellow => yellow.wrap(text)!,
    .blue => blue.wrap(text)!,
    .magenta => magenta.wrap(text)!,
    .cyan => cyan.wrap(text)!,
    .white => white.wrap(text)!,
    .gray => darkGray.wrap(text)!,
  };
}
