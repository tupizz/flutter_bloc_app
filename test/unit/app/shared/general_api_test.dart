import 'package:flutter_test/flutter_test.dart';

import './../../../../lib/app/shared/models/post.dart';
import './../../../../lib/app/shared/repositories/general_api.dart';

main() {
  var api = GeneralApi();

  test('get posts', () async {
    List<Post> data = await api.getPosts();
    expect(data[0].userId, 1);
  }, skip: true);
}
