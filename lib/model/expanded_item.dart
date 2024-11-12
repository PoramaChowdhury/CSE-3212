class Item {
  String title;
  String content;
  bool isExpanded;
  List<String>? subContent;

  Item({
    required this.title,
    required this.content,
    this.isExpanded = false,
    this.subContent,
  });
}
