import 'dart:convert';
import 'dart:math';

import 'package:bliss_challenge/components/custom_toast.dart';
import 'package:bliss_challenge/services/github_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' as http;

import '../models/emoji_model.dart';

class EmojiBloc extends BlocBase {
  Future<List<EmojiModel>> getEmojis() async {
    var emojis = <EmojiModel>[];

    var result = await http.get("${GitHubApi.emojisRoute}");

    if (result.statusCode != 200) {
      CustomToast.fail('Failed to Find This Emojis.');
      return emojis;
    }

    var parsedList = jsonDecode(result.body);

    try {
      await Future.wait(parsedList.forEach((key, value) {
        emojis.add(EmojiModel(name: key, url: value));
      }));
    } catch (e) {}

    return emojis;
  }

  Future<EmojiModel> getRandomEmoji() async {
    var emojis = await getEmojis();

    if (emojis.length == 0) return null;

    final _random = new Random();
    return emojis[_random.nextInt(emojis.length)];
  }
}
