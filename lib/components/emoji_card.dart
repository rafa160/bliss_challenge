import 'package:bliss_challenge/components/cached_image.dart';
import 'package:bliss_challenge/models/emoji_model.dart';
import 'package:flutter/material.dart';

class EmojiCard extends StatelessWidget {
  final EmojiModel model;
  final VoidCallback onTap;
  final bool isFavorite;

  const EmojiCard({Key key, this.model, this.onTap, this.isFavorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isFavorite ? Colors.green : Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: CustomCachedImage(model.url),
      ),
    );
  }
}
