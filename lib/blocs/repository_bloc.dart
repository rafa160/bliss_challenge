import 'dart:convert';

import 'package:bliss_challenge/components/custom_toast.dart';
import 'package:bliss_challenge/models/repository_model.dart';
import 'package:bliss_challenge/services/github_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' as http;

class RepositoryBloc extends BlocBase {
  Future<Repository> getRepositories({String name}) async {
    var url = (name == null || name.isEmpty)
        ? "${GitHubApi.googleRepositoryRoute}"
        : "${GitHubApi.userRepositoryRoute}$name${GitHubApi.stringRepo}";

    var result = await http.get(url);

    if (result.statusCode != 200) {
      CustomToast.fail('Failed to Find This Repository or it Doesnt exist.');
      return null;
    }

    return Repository.fromJson(json.decode(result.body));
  }
}
