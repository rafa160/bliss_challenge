import 'dart:convert';

import 'package:bliss_challenge/components/custom_toast.dart';
import 'package:bliss_challenge/models/user_model.dart';
import 'package:bliss_challenge/services/github_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' as http;

class UserBloc extends BlocBase {
  Future<User> getUserByName(String name) async {
    var result = await http.get("${GitHubApi.userRepositoryRoute}$name");

    if (result.statusCode != 200) {
      CustomToast.fail('Failed to Find This User or it Doesnt exist.');
      return null;
    }

    var user = json.decode(result.body);

    return User.fromJson(user);
  }
}
