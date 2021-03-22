import 'package:bliss_challenge/blocs/favorite_bloc.dart';
import 'package:bliss_challenge/components/buttons/cutsom_back_button.dart';
import 'package:bliss_challenge/components/circular_progress_indicator.dart';
import 'package:bliss_challenge/components/emoji_card.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bliss_challenge/models/emoji_model.dart';
import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FavoritesEmojiScreen extends StatefulWidget {
  @override
  _FavoritesEmojiScreenState createState() => _FavoritesEmojiScreenState();
}

class _FavoritesEmojiScreenState extends State<FavoritesEmojiScreen> {
  var favBloc = BlocProvider.getBloc<FavoriteBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textWhite,
        title: Text(
          Strings.MY_FAVORITES_EMOJIS_TITLE,
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
        child: StreamBuilder<Map<String, EmojiModel>>(
          stream: favBloc.outFav,
          initialData: {},
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CustomCircularProgressIndicator();
              default:
            }
            if (!snapshot.hasData ||
                snapshot.hasError ||
                snapshot.data.length == 0) {
              return CustomBackButton();
            }

            return GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 6,
              mainAxisSpacing: 10.0,
              physics: const AlwaysScrollableScrollPhysics(),
              children: snapshot.data.values.map((emoji) {
                return EmojiCard(
                  onTap: () {
                    favBloc.removeFavorite(emoji);
                  },
                  model: emoji,
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
