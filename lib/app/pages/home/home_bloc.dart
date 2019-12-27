import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import './../../shared/repositories/general_api.dart';
import './../../shared/models/post.dart';

class HomeBloc implements BlocBase {
  final GeneralApi api;

  HomeBloc(this.api);

  final BehaviorSubject _listController = BehaviorSubject.seeded(true);

  Sink get listIn => _listController.sink;
  Stream<List<Post>> get listOut =>
      _listController.stream.asyncMap((v) => api.getPosts());

  @override
  void dispose() {
    _listController.close();
  }
}
