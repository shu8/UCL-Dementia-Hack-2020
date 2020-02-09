class Memory {
  final int category;
  final String text;
  final int timestamp;
  final List<String> media;

  Memory({this.category, this.text, this.timestamp, this.media});

  factory Memory.fromMap(Map<String, dynamic> json) => new Memory(
        category: json["category"],
        text: json["text"],
        timestamp: json["timestamp"],
        media: json["media"] == null ? [] : json["media"].split(','),
      );

  int getCategory() {
    return category;
  }

  String getText() {
    return text;
  }

  String getDate() {
    DateTime day = new DateTime.fromMillisecondsSinceEpoch(this.timestamp);
    String ymd = day.toString().substring(0, day.toString().indexOf(' '));
    //print("OK: " + date2.toString());
    return ymd; //maybe datetime?
  }

  List getMedia() {
    return media;
  }

  int getNumOfMemories() {
    return media.length;
  }
}
