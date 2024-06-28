class DataModel{
  String? createdAt;
  String? icon;
  String? id;
  String? updatedAt;
  String? url;
  String? value;

  DataModel({this.createdAt, this.icon, this.id, this.updatedAt, this.url, this.value});

  factory DataModel.fromJson(Map json){
    return DataModel(
      createdAt: json['created_at'],
      icon: json['icon_url'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
      value: json['value'],
    );
  }
}

// class ChuckNorrisJoke {
//   final List<String> categories;
//   final DateTime createdAt;
//   final String iconUrl;
//   final String id;
//   final DateTime updatedAt;
//   final String url;
//   final String value;
//
//   ChuckNorrisJoke({
//     required this.categories,
//     required this.createdAt,
//     required this.iconUrl,
//     required this.id,
//     required this.updatedAt,
//     required this.url,
//     required this.value,
//   });
//
//   factory ChuckNorrisJoke.fromJson(Map<String, dynamic> json) {
//     return ChuckNorrisJoke(
//       categories: List<String>.from(json['categories']),
//       createdAt: DateTime.parse(json['created_at']),
//       iconUrl: json['icon_url'],
//       id: json['id'],
//       updatedAt: DateTime.parse(json['updated_at']),
//       url: json['url'],
//       value: json['value'],
//     );
//   }
// }

