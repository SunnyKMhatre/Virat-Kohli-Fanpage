class FamilyModal {
  String? id;
  String? image;
  String? title;
  String? thumbImage;

  FamilyModal({this.id, this.image, this.title, this.thumbImage});

  FamilyModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    title = json["title"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["title"] = title;
    _data["thumb_image"] = thumbImage;
    return _data;
  }

  static List<FamilyModal> offamilymodal(List value) {
    return value.map((e) => FamilyModal.fromJson(e)).toList();
  }
}
