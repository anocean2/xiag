class Place {
  String? url;
  String? urlTn;
  String? name;

  Place({this.url, this.urlTn, this.name});

  Place.fromJson(Map<String, dynamic> json) {
    url = json['url'] as String;
    urlTn = json['url_tn'] as String;
    name = json['name'] as String;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['url_tn'] = urlTn;
    map['name'] = name;
    return map;
  }
}
