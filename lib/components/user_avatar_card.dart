import 'package:bliss_challenge/components/cached_image.dart';
import 'package:bliss_challenge/models/user_model.dart';
import 'package:flutter/material.dart';

class UserAvatarCard extends StatelessWidget {
  final User model;
  final VoidCallback onTap;

  const UserAvatarCard({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: CustomCachedImage(model.avatarUrl),
      ),
    );
  }
}
