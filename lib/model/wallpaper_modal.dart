class WallpaperModal {
  String? id;
  String? image;
  String? thumbImage;

  WallpaperModal({this.id, this.image, this.thumbImage});

  WallpaperModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["thumb_image"] = thumbImage;
    return _data;
  }

  static List<WallpaperModal> ofwallpapermodal(List value) {
    return value.map((e) => WallpaperModal.fromJson(e)).toList();
  }
}
