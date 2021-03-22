import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:bliss_challenge/blocs/emoji_bloc.dart';
import 'package:bliss_challenge/blocs/favorite_bloc.dart';
import 'package:bliss_challenge/components/buttons/cutsom_back_button.dart';
import 'package:bliss_challenge/components/circular_progress_indicator.dart';
import 'package:bliss_challenge/components/emoji_card.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/emoji_model.dart';

class EmojisScreen extends StatefulWidget {
  @override
  _EmojisScreenState createState() => _EmojisScreenState();
}

class _EmojisScreenState extends State<EmojisScreen> {
  var emojiBloc = BlocProvider.getBloc<EmojiBloc>();
  var favBloc = BlocProvider.getBloc<FavoriteBloc>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textWhite,
        elevation: 0,
        title: Text(
          Strings.EMOJI_SCREEN_TITLE,
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
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<List<EmojiModel>>(
              future: emojiBloc.getEmojis(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return CustomCircularProgressIndicator();
                  default:
                    if (!snapshot.hasData || snapshot.hasError) {
                      return CustomBackButton();
                    }

                    return StreamBuilder<Map<String, EmojiModel>>(
                        stream: favBloc.outFav,
                        initialData: {},
                        builder: (context, streamSnapshot) {
                          if (!streamSnapshot.hasData) {
                            return Container();
                          }
                          return Container(
                            height: ScreenUtil.screenHeight,
                            color: textWhite,
                            child: GridView.builder(
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                              ),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                var emoji = snapshot.data[index];

                                var isFavorited = streamSnapshot.data.keys
                                    .contains(emoji.name);

                                return EmojiCard(
                                  isFavorite: isFavorited,
                                  model: emoji,
                                  onTap: () async {
                                    favBloc.toggleAsFavorite(emoji);
                                  },
                                );
                              },
                            ),
                          );
                        });
                }
              }),
        ),
      ),
    );
  }
}
