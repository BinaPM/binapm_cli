abstract class Element {
  const Element();

  String render();
}

abstract class Widget {
  const Widget();

  Element create();
}
