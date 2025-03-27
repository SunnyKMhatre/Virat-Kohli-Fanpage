class SingleNewsModal {
  String? id;
  String? newsTitle;
  String? newsImage;
  String? thumbImage;
  String? newsDesc;

  SingleNewsModal(
      {this.id,
      this.newsTitle,
      this.newsImage,
      this.thumbImage,
      this.newsDesc});

  SingleNewsModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    newsTitle = json["news_title"];
    newsImage = json["news_image"];
    thumbImage = json["thumb_image"];
    newsDesc = json["news_desc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["news_title"] = newsTitle;
    _data["news_image"] = newsImage;
    _data["thumb_image"] = thumbImage;
    _data["news_desc"] = newsDesc;
    return _data;
  }
}
