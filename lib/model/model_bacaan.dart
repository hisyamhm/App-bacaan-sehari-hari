class ModelBacaan {
  String name;
  String arabic;
  String latin;
  String terjemahan;
  String audioUrl;

  ModelBacaan({
    required this.name,
    required this.arabic,
    required this.latin,
    required this.terjemahan,
    required this.audioUrl,
  });

  factory ModelBacaan.fromJson(Map<String, dynamic> json) {
    return ModelBacaan(
      name: json['name'],
      arabic: json['arabic'],
      latin: json['latin'],
      terjemahan: json['terjemahan'],
      audioUrl: json['audioUrl'],
    );
  }
}
