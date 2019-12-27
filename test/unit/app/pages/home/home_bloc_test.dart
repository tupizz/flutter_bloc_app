import 'package:bloc_flutter_app_study/app/pages/home/home_bloc.dart';
import 'package:bloc_flutter_app_study/app/shared/models/post.dart';
import 'package:bloc_flutter_app_study/app/shared/repositories/general_api.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  var bloc = HomeBloc(GeneralApi());

  test('Test if completed list', () {
    bloc.listIn.add(true);

    expect(bloc.listOut, emits(List<Post>()));
  }, skip: true);
}
