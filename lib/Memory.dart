class Memory {
  final int category;
  final String text;
  final String date;
  final List media;

  Memory({this.category, this.text, this.date, this.media});

  int getCategory() {
    return category;
  }

  String getText() {
    return text;
  }

  String getDate() {
    return date; //maybe datetime?
  }

  List getMedia() {
    return media;
  }

  int getNumOfMemories() {
    return media.length;
  }
}
