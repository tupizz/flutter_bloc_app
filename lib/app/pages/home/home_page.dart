import 'package:bloc_flutter_app_study/app/pages/home/home_bloc.dart';
import 'package:bloc_flutter_app_study/app/shared/models/post.dart';
import 'package:bloc_flutter_app_study/app/shared/repositories/general_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Injetamos a dependência definida no main.dart
    final HomeBloc bloc = BlocProvider.getBloc<HomeBloc>();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Injeção de dependências'),
      ),
      body: StreamBuilder<List<Post>>(
        stream: bloc.listOut,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          List<Post> posts = snapshot.data;

          return ListView.separated(
            itemCount: posts.length,
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                title: Text(posts[index].title),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider(color: Colors.black26);
            },
          );
        },
      ),
    );
  }
}
