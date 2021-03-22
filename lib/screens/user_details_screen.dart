import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:bliss_challenge/blocs/user_bloc.dart';
import 'package:bliss_challenge/components/buttons/cutsom_back_button.dart';
import 'package:bliss_challenge/components/circular_progress_indicator.dart';
import 'package:bliss_challenge/components/slimy_cards/user_profile_card.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailsScreen extends StatefulWidget {
  final String user;

  const UserDetailsScreen({Key key, this.user}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  var userBloc = BlocProvider.getBloc<UserBloc>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textWhite,
        elevation: 0,
        title: Text(
          Strings.PROFILE_TITLE_SCREEN,
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
        child: FutureBuilder(
            future: userBloc.getUserByName(widget.user),
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
                      child: UserProfileCard(
                        onTap: () {

                        },
                        user: snapshot.data,
                      ));
              }
            }),
      ),
    );
  }
}
