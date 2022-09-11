
import 'package:dio/dio.dart';
import 'package:fluttermvvm/repositories/posts_repo.dart';

import '../models/post_model.dart';

class PostsRepositoryImplement extends PostsRepository{
  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> posts = [];
   try{
        var response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
        var list = response.data as List;
        posts=list.map((e) => PostModel.fromJson(e)).toList();

       }catch(exception){
        print(exception);
       }
       return posts;
  }

  @override
  Future<PostModel> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

}