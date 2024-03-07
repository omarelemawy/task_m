import 'package:flutter/foundation.dart';
import 'package:lunment_ventures/features/post/domain/entities/post.dart';
import 'package:lunment_ventures/features/post/domain/use_cases/get_posts_use_case.dart';

class HomeProvider with ChangeNotifier {
  GetPostsUseCase getPostsUseCase;
  HomeProvider(this.getPostsUseCase);
  bool isLoading = false;
  List<Post>? postsList;
  getPosts() async {
    final result = await getPostsUseCase();
    isLoading = true;
    notifyListeners();
    result.fold((failure) {
      print("=====>$failure");
    }, (result) {
      isLoading = false;

      postsList = result;
      notifyListeners();
    });
  }

  initPage() {
    getPosts();
  }
}
