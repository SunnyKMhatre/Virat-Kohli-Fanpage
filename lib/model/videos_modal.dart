class VideosModal {
  String? id;
  String? image;
  String? thumbImage;
  String? title;
  String? url;

  VideosModal({this.id, this.image, this.thumbImage, this.title, this.url});

  VideosModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    thumbImage = json["thumb_image"];
    title = json["title"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["thumb_image"] = thumbImage;
    _data["title"] = title;
    _data["url"] = url;
    return _data;
  }

  static List<VideosModal> ofvideosmodal(List value) {
    return value.map((e) => VideosModal.fromJson(e)).toList();
  }
}
