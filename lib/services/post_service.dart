import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:provider_course/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<PostModel?> getAllPostData() async {
    PostModel? postResult;

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/2'),
        headers: {
          HttpHeaders.contentTypeHeader : 'application/json',
        },
      );
      if(response.statusCode == 200){
        final item = json.decode(response.body);
        postResult = PostModel.fromJson(item);

      } else {
        print('Error');
      }
    } catch (e) {
      log(e.toString());
    }
    return postResult;
  }
}
