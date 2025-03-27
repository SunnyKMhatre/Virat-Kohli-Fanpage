class SloganModal {
  String? id;
  String? slogan;

  SloganModal({this.id, this.slogan});

  SloganModal.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    slogan = json["slogan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["slogan"] = slogan;
    return _data;
  }

  static List<SloganModal> ofsloganmodal(List value) {
    return value.map((e) => SloganModal.fromJson(e)).toList();
  }
}
