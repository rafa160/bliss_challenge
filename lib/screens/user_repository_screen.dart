
import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:bliss_challenge/blocs/repository_bloc.dart';
import 'package:bliss_challenge/components/buttons/cutsom_back_button.dart';
import 'package:bliss_challenge/components/circular_progress_indicator.dart';
import 'package:bliss_challenge/components/slimy_cards/repository_card.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bliss_challenge/models/repository_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRepositoryScreen extends StatefulWidget {
  final Repository repository;

  const UserRepositoryScreen({Key key, this.repository}) : super(key: key);

  @override
  _UserRepositoryScreenState createState() => _UserRepositoryScreenState();
}

class _UserRepositoryScreenState extends State<UserRepositoryScreen> {
  var repositoryBloc = BlocProvider.getBloc<RepositoryBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textWhite,
        elevation: 0,
        title: Text(
          Strings.REPOSITORIES_TITLE_SCREEN,
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
      body: FutureBuilder(
          future: repositoryBloc.getRepositories(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CustomCircularProgressIndicator();
              default:
                if (!snapshot.hasData || snapshot.hasError) {
                  return CustomBackButton();
                }

                return Container(
                  height: ScreenUtil.screenHeight,
                  color: textWhite,
                  child: ListView.builder(
                    itemCount: widget.repository.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RepositoryItemCard(
                        model: widget.repository.items[index],
                      );
                    },
                  ),
                );
            }
          }),
    );
  }
}
