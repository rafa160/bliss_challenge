
import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:bliss_challenge/blocs/favorite_bloc.dart';
import 'package:bliss_challenge/components/buttons/cutsom_back_button.dart';
import 'package:bliss_challenge/components/user_avatar_card.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bliss_challenge/models/user_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FavoritesAvatarScreen extends StatefulWidget {
  @override
  _FavoritesAvatarScreenState createState() => _FavoritesAvatarScreenState();
}

class _FavoritesAvatarScreenState extends State<FavoritesAvatarScreen> {
  var favBloc = BlocProvider.getBloc<FavoriteBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textWhite,
        title: Text(
          Strings.MY_FAVORITES_AVATARS_SCREEN_TITLE,
          style: appTitle,
        ),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<Map<String, User>>(
          stream: favBloc.outFavUserAvatar,
          initialData: {},
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.hasError) {
              return CustomBackButton();
            }

            return GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 6,
              mainAxisSpacing: 10.0,
              physics: const AlwaysScrollableScrollPhysics(),
              children: snapshot.data.values.map((user) {
                return UserAvatarCard(
                  onTap: () {
                    favBloc.removeUserFavAvatar(user);
                  },
                  model: user,
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
