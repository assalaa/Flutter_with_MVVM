
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repositories/posts_repo_implement.dart';
import '../theme/app_colours.dart';
import '../view_models/post_view_model.dart';
import '../view_models/posts_view_model.dart';

class PostsView extends StatelessWidget {
   PostsView({Key? key}) : super(key: key);
var postsVM= PostsViewMOdel(postsRepository: PostsRepositoryImplement());
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation:0,title: Text(postsVM.pageTitle, style: TextStyle(fontSize: 18, color: Colors.black),), backgroundColor: Colors.white,),
      body: Center(
        child: FutureBuilder<List<PostViewModel>>(
          future: postsVM.fetchAllPosts(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else{
              var posts = snapshot.data;
              return ListView.builder(
                itemCount:posts?.length ,
                itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width-20,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: background_color,
              boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 3,
        blurRadius: 4,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(child: Text("Date",style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( 
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: pink_color

            ), 
            child: Center(child: Text(" user "+ posts![index].id.toString(),style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),)),
                  ),
              ],),
                ),
              
              
                Expanded(
                  child: Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Text(posts![index].title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      Expanded(child: Text(posts![index].body,style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)))
                    ],),
                  ),
                ),
              
            ],),
          ),
        )
      ]),
              );
            }

          }),)
        /*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width-20,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: background_color,
              boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 3,
        blurRadius: 4,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(child: Text("Date",style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal),),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( 
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: pink_color

            ), 
            child: Center(child: Text("User 1",style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),)),
                  ),
              ],),
                ),
              
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: const[
                    Text("Title", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("POsts content goes here",style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))
                  ],),
                ),
              
            ],),
          ),
        )
      ]),*/
      );
    
    
  }
}