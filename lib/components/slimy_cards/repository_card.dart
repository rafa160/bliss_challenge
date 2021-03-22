import 'package:bliss_challenge/components/slimy_cards/slimy_card.dart';
import 'package:bliss_challenge/models/repository_item_model.dart';
import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:flutter/material.dart';

class RepositoryItemCard extends StatelessWidget {

  final RepositoryItem model;

  const RepositoryItemCard({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSlimyCard(
      color: textBlack,
      topWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.description, size: 40, color: textWhite,),
          Text(model.name ?? '', style: appSubTitle, ),
        ],
      ),
      bottomWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
                child: Text(model.description ?? '',style: appSubTitle,),

            ),
            SizedBox(
              height: 5,
            ),
            Text(
              model.language ?? '', style: appSubTitle,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(Icons.star, size: 20,color: yellow,),
                Text('${model.stargazersCount}',style: appSubTitle,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
