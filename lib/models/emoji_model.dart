
class EmojiModel {

  String name;
  String url;

  EmojiModel({this.name, this.url});

  EmojiModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
  };

  @override
  String toString() {
    return 'EmojiModel{name: $name, url: $url}';
  }
}