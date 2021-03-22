
import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:bliss_challenge/blocs/favorite_bloc.dart';
import 'package:bliss_challenge/components/emoji_card.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bliss_challenge/models/emoji_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class RandomEmojiScreen extends StatefulWidget {
  final EmojiModel model;

  const RandomEmojiScreen({Key key, this.model}) : super(key: key);

  @override
  _RandomEmojiScreenState createState() => _RandomEmojiScreenState();
}

class _RandomEmojiScreenState extends State<RandomEmojiScreen> {
  var favBloc = BlocProvider.getBloc<FavoriteBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textWhite,
        elevation: 0,
        title: Text(
          Strings.RANDOM_EMOJI_TITLE,
          style: appTitle,
        ),
        centerTitle: true,
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
      body: Container(
        color: textWhite,
        child: Center(
          child: EmojiCard(
            model: widget.model,
          ),
        ),
      ),
    );
  }
}
