import 'package:bliss_challenge/models/user_model.dart';

class RepositoryItem {
  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  User user;
  String htmlUrl;
  dynamic description;
  String url;
  int stargazersCount;
  DateTime createdAt;
  DateTime updatedAt;
  String language;

  RepositoryItem({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.user,
    this.htmlUrl,
    this.description,
    this.url,
    this.stargazersCount,
    this.createdAt,
    this.updatedAt,
    this.language,
  });

  factory RepositoryItem.fromJson(Map<String, dynamic> json) => RepositoryItem(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    user: User.fromJson(json["owner"]),
    htmlUrl: json["html_url"],
    description: json["description"],
    url: json["url"],
    stargazersCount: json["stargazers_count"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "owner": user.toJson(),
    "html_url": htmlUrl,
    "description": description,
    "url": url,
    "stargazers_count": stargazersCount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "language": language,
  };
}
