import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:lunment_ventures/core/consts/navigation_service.dart';
import 'package:lunment_ventures/features/post/domain/entities/my_comment.dart';
import 'package:lunment_ventures/features/post/domain/entities/post.dart';
import 'package:lunment_ventures/features/post/domain/use_cases/delete_post_use_case.dart';
import 'package:lunment_ventures/features/post/domain/use_cases/get_comments_use_case.dart';
import 'package:lunment_ventures/features/post/domain/use_cases/get_post_details_use_case.dart';

class PostDetailsProvider with ChangeNotifier {
  GetPostDetailsUseCase getPostDetailsUseCase;
  GetCommentsUseCase getCommentsUseCase;
  DeletePostUseCase deletePostUseCase;
  PostDetailsProvider(
    this.getPostDetailsUseCase,
    this.getCommentsUseCase,
    this.deletePostUseCase,
  );
  bool isLoading = false;
  Post? postsDetails;
  List<MyComment>? commentList;
  int? id;
  getPosts() async {
    final result = await getPostDetailsUseCase(id: id!);
    isLoading = true;
    notifyListeners();
    result.fold((failure) {
      print("=====>$failure");
    }, (result) {
      isLoading = false;

      postsDetails = result;
      notifyListeners();
    });
  }

  getComments() async {
    final result = await getCommentsUseCase(id: id!);
    isLoading = true;
    notifyListeners();
    result.fold((failure) {
      print("=====>$failure");
    }, (result) {
      isLoading = false;

      commentList = result;
      notifyListeners();
    });
  }

  deletePost() async {
    final result = await deletePostUseCase(id: id!);
    isLoading = true;
    notifyListeners();
    result.fold((failure) {
      print("=====>$failure");
    }, (result) {
      isLoading = false;
      NavigationService.context.pop();

      notifyListeners();
    });
  }

  initPage(int id) {
    this.id = id;
    getPosts();
    getComments();
  }
}
