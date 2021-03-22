
import 'file:///home/rafa160/Downloads/bliss_challenge/lib/helpers/constants.dart';
import 'package:bliss_challenge/blocs/emoji_bloc.dart';
import 'package:bliss_challenge/blocs/repository_bloc.dart';
import 'package:bliss_challenge/blocs/user_bloc.dart';
import 'package:bliss_challenge/components/buttons/custom_buttom.dart';
import 'package:bliss_challenge/components/main_card.dart';
import 'package:bliss_challenge/components/random_card.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var repositoryBloc = BlocProvider.getBloc<RepositoryBloc>();
  var userBloc = BlocProvider.getBloc<UserBloc>();
  var emojiBloc = BlocProvider.getBloc<EmojiBloc>();
  var _controller = TextEditingController();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          Strings.APP_NAME,
          style: appTitle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: FormBuilderTextField(
                      initialValue: null,
                      name: 'name',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 3)
                      ]),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: _controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.only(left: 20.0, top: 20.0),
                          hintText: Strings.HINT_USER_TEXT,
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 0.6))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomButton(
                        onPressed: () async {},
                        text: Strings.HINT_USER_NAME_BUTTON,
                      ),
                      Spacer(),
                      CustomButton(
                        onPressed: () async {
                        },
                        text: Strings.SEARCH_USER_REPOSITORIES,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                      },
                      child: MainCard(Strings.HINT_SEARCH_GOOGLE_REPOS, FontAwesomeIcons.google,
                          Colors.red),
                    ),
                    GestureDetector(
                        onTap: () async {
                        },
                        child: MainCard(
                            Strings.HINT_SEARCH_EMOJI, FontAwesomeIcons.icons, Colors.greenAccent))
                  ],
                ),
                GestureDetector(
                    onTap: () async {},

                    child: RandomCard(
                        Strings.RANDOM_EMOJI_TITLE, FontAwesomeIcons.random, Colors.amberAccent)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () async {

                        },
                        child: MainCard(
                            Strings.HINT_FAV_EMOJIS, FontAwesomeIcons.heart, Colors.deepOrangeAccent)),
                    GestureDetector(
                        onTap: () async {

                        },
                        child: MainCard(
                            Strings.HINT_FAV_AVATARS, FontAwesomeIcons.icons, Colors.indigoAccent)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}