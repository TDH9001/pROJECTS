class ArticleModel {
  ArticleModel(this.image, this.subTitle, this.title);
  final String? image;
  final String? title;
  final String? subTitle;
  @override
  String toString() {
    // TODO: implement toString
    return """
 $image
    $title
    $subTitle

""";
  }
}
