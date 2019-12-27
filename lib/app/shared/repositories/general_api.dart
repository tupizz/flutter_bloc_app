import 'dart:convert';
import 'package:dio/dio.dart';

import './../config.dart';
import './../models/post.dart';

class GeneralApi {
  Dio dio;

  GeneralApi(this.dio);

  Future<List<Post>> getPosts() async {
    Response response = await dio.get('/posts');
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }
}
