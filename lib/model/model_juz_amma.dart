class ModelJuz {
  int? id;
  String? name;
  String? arabic;
  String? latin;
  String? terjemahan;

  ModelJuz(this.id, this.name, this.arabic, this.latin, this.terjemahan);

  ModelJuz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arabic = json['arabic'];
    latin = json['latin'];
    terjemahan = json['terjemahan'];
  }
}
