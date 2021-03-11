class Quote {
  final String sId;
  final List<String> tags;
  final String content;
  final String author;
  final int length;
  int isFavourite = 0;

  Quote(
      {this.sId,
      this.tags,
      this.content,
      this.author,
      this.length,
      this.isFavourite});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        sId: json['_id'],
        tags: json['tags'].cast<String>(),
        content: json['content'],
        author: json['author'],
        length: json['length'],
        isFavourite: 0);
  }

  factory Quote.fromMap(Map<String, dynamic> json) {
    return Quote(
      sId: json['sId'],
      tags: (json['tags']
              .toString()
              .substring(1, json['tags'].toString().length - 1))
          .split(','),
      content: json['content'],
      author: json['author'],
      length: int.parse(json['length']),
      isFavourite: int.parse(json['isFavourite']),
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sId'] = this.sId;
    data['tags'] = this.tags.toString();
    data['content'] = this.content;
    data['author'] = this.author;
    data['length'] = this.length;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}
