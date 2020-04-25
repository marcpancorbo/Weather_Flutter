class Icon {
  String icon;
  String code;
  String description;

  Icon(this.icon, this.code, this.description);

  factory Icon.fromJson(Map<String, dynamic> json) {
    return Icon(json["icon"], json["code"], json["description"]);
  }
}
