
import 'package:fluttermvvm/view_models/post_view_model.dart';

import '../models/post_model.dart';
import '../repositories/posts_repo.dart';

class PostsViewMOdel{
  final String pageTitle = "All Posts";
  PostsRepository? postsRepository;
  PostsViewMOdel({this.postsRepository});


  Future<List<PostViewModel>>fetchAllPosts() async {
       List<PostModel> list = await postsRepository!.getAllPosts();
       return list.map((e) => PostViewModel(postModel: e)).toList();
  }
}