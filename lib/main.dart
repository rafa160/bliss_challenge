import 'package:bliss_challenge/blocs/emoji_bloc.dart';
import 'package:bliss_challenge/blocs/repository_bloc.dart';
import 'package:bliss_challenge/blocs/user_bloc.dart';
import 'package:bliss_challenge/screens/splash_screen.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() {
  runApp(BlocProvider(
    blocs: [
      Bloc((i) => UserBloc()),
      Bloc((i) => EmojiBloc()),
      Bloc((i) => RepositoryBloc()),

    ],
    child: GetMaterialApp(
      title: "Bliss Challenge",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}