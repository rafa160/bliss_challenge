import 'package:bliss_challenge/components/cached_image.dart';
import 'package:bliss_challenge/components/slimy_cards/slimy_card.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bliss_challenge/models/user_model.dart';
import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfileCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserProfileCard({Key key, this.user, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomSlimyCard(
        color: textBlack,
        topWidget: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CustomCachedImage(user.avatarUrl),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              user.login ?? '',
              style: appSubTitle,
            ),
          ],
        ),
        bottomWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                user.bio ?? '',
                style: appDescriptionUser,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 5,
              ),
              Flexible(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.email,
                      size: 15,
                      color: textWhite,
                    ),
                    Text(
                      user.email ?? Strings.EMAIL_NOT_INFORMED,
                      style: appEmailUser,
                    ),
                    Spacer(),
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: textWhite,
                    ),
                    Text(
                      user.location ?? '',
                      style: appEmailUser,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Flexible(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.list,
                      size: 15,
                      color: textWhite,
                    ),
                    Text(
                      '${user.publicRepo}' ?? Strings.NO_INFO,
                      style: appEmailUser,
                    ),
                    Spacer(),
                    Icon(
                      Icons.person_add_alt_1,
                      size: 15,
                      color: textWhite,
                    ),
                    Text(
                      '${user.followers}' ?? '',
                      style: appEmailUser,
                    ),
                    Spacer(),
                    Icon(
                      Icons.person_add_alt_1_rounded,
                      size: 15,
                      color: textWhite,
                    ),
                    Text(
                      '${user.followings}' ?? '',
                      style: appEmailUser,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
