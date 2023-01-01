


import 'package:flutter/material.dart';
import 'package:provider_course/models/post_model.dart';
import 'package:provider_course/services/post_service.dart';

class PostProvider extends ChangeNotifier{
  PostModel? post;
  bool isLoading = false;

  getPostData() async{
    isLoading = true;
    post = await PostService().getAllPostData();
    isLoading = false;
    notifyListeners();
  }
}