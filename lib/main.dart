import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import './app/pages/home/home_page.dart';
import './app/pages/home/home_bloc.dart';
import './app/shared/repositories/custom_dio.dart';
import './app/shared/repositories/general_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: createApp(),
      dependencies: [
        Dependency((inject) => CustomDio(), singleton: true),
        Dependency((inject) => GeneralApi(inject.get<CustomDio>().getClient())),
      ],
      blocs: [
        Bloc((inject) => HomeBloc(inject.get<GeneralApi>())),
      ],
    );
  }

  MaterialApp createApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
