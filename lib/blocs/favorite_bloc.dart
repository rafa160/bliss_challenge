import 'dart:convert';


import 'package:bliss_challenge/components/custom_toast.dart';
import 'package:bliss_challenge/models/emoji_model.dart';
import 'package:bliss_challenge/models/user_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/strings.dart';

class FavoriteBloc extends BlocBase {
  Map<String, EmojiModel> _favoritesEmojis = {};
  Map<String, User> _userFavAvatar = {};

  final _favController = BehaviorSubject<Map<String, EmojiModel>>();
  final _favAvatarController = BehaviorSubject<Map<String, User>>();

  Stream<Map<String, EmojiModel>> get outFav => _favController.stream;

  Stream<Map<String, User>> get outFavUserAvatar => _favAvatarController.stream;

  FavoriteBloc() {
    SharedPreferences.getInstance().then((prefs) {
      _setFavorites(prefs);
      _setFavoriteAvatars(prefs);
    });
  }

  void _setFavoriteAvatars(SharedPreferences prefs) {
    if (_keyContainSaved(prefs, Strings.SHARED_PREFERENCE_FAVORITE_AVATARS)) {
      _userFavAvatar = json
          .decode(prefs.getString(Strings.SHARED_PREFERENCE_FAVORITE_AVATARS))
          .map((k, v) {
        return MapEntry(k, User.fromJson(v));
      }).cast<String, User>();
      _favAvatarController.add(_userFavAvatar);
    }
  }

  bool _keyContainSaved(SharedPreferences prefs, String name) =>
      prefs.getKeys().contains(name);

  void _setFavorites(SharedPreferences prefs) {
    if (_keyContainSaved(prefs, Strings.SHARED_PREFERENCE_FAVORITE)) {
      _favoritesEmojis = json
          .decode(prefs.getString(Strings.SHARED_PREFERENCE_FAVORITE))
          .map((k, v) {
        return MapEntry(k, EmojiModel.fromJson(v));
      }).cast<String, EmojiModel>();
      _favController.add(_favoritesEmojis);
    }
  }

  void toggleAsFavorite(EmojiModel model) {
    if (_favoritesEmojis.containsKey(model.name)) {
      CustomToast.fail('Emoji is already in the Fav List or Cant be add');
    } else {
      CustomToast.success('Emoji added.');
      _setUpFavoriteStream(model);
      _saveFavorite();
    }
  }

  void _setUpFavoriteStream(EmojiModel model) {
    _favoritesEmojis[model.name] = model;
    _favController.sink.add(_favoritesEmojis);
  }

  void toggleAsFavoriteAvatar(User user) {
    if (_userFavAvatar.containsKey(user.login)) {
      CustomToast.fail('Avatar is already in the Fav List or Cant be add');
    } else {
      CustomToast.success('Avatar added.');
      _setUpFavoriteAvatar(user);
      _saveFavoriteUserAvatar();
    }
  }

  void _setUpFavoriteAvatar(User user) {
    _userFavAvatar[user.login] = user;
    _favAvatarController.sink.add(_userFavAvatar);
  }

  void removeFavorite(EmojiModel model) async {
    CustomToast.success('Emoji Removed');
    _favoritesEmojis[model.name] = model;
    _favoritesEmojis.remove(model.name);
    _favController.sink.add(_favoritesEmojis);
  }

  void removeUserFavAvatar(User user) async {
    CustomToast.success('Avatar Removed');
    _userFavAvatar[user.login] = user;
    _userFavAvatar.remove(user.login);
    _favAvatarController.sink.add(_userFavAvatar);
  }

  void _saveFavorite() {
    _setEmojiOnSharedPreference(
        Strings.SHARED_PREFERENCE_FAVORITE, _favoritesEmojis);
  }

  _setEmojiOnSharedPreference(String item, Map<String, EmojiModel> value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(Strings.SHARED_PREFERENCE_FAVORITE, json.encode(value));
    });
  }

  _setUserOnSharedPreference(String item, Map<String, User> value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(Strings.SHARED_PREFERENCE_FAVORITE, json.encode(value));
    });
  }

  void _saveFavoriteUserAvatar() {
    _setUserOnSharedPreference(
        Strings.SHARED_PREFERENCE_FAVORITE_AVATARS, _userFavAvatar);
  }

  @override
  void dispose() {
    _favController.close();
    _favAvatarController.close();
    super.dispose();
  }
}
