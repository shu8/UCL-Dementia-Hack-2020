class Memory {
  final int category;
  final String text;
  final int timestamp;
  final List media;

  Memory({this.category, this.text, this.timestamp, this.media});

  factory Memory.fromMap(Map<String, dynamic> json) => new Memory(
        category: json["category"],
        text: json["text"],
        timestamp: json["timestamp"],
      );

  int getCategory() {
    return category;
  }

  String getText() {
    return text;
  }

  int getDate() {
    return timestamp; //maybe datetime?
  }

  List getMedia() {
    return media;
  }

  int getNumOfMemories() {
    return media.length;
  }
}
