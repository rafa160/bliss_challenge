
import 'dart:convert';

import 'package:bliss_challenge/models/repository_item_model.dart';

Repository repositoriesFromJson(String str) =>
    Repository.fromJson(json.decode(str));

String repositoriesToJson(Repository data) => json.encode(data.toJson());

class Repository {
  List<RepositoryItem> items;

  Repository({this.items});

  factory Repository.fromJson(List<dynamic> jsonArray) {
    List<RepositoryItem> items = [];
    for (var i = 0; i < jsonArray.length; i++) {
      items.add(RepositoryItem.fromJson(jsonArray[i]));
    }
    return Repository(
      items: items,
    );
  }

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Repository{items: $items}';
  }
}
