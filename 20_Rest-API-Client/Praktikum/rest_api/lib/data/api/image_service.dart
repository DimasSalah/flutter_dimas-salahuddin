import 'package:dio/dio.dart';

class ImageService {
  static Future<Response> imageUrl(String style, String url) async {
    try {
      Response response = await Dio().get('https://api.dicebear.com/8.x/$style/svg?seed=$url');
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load image');
      }
    } catch (error) {
      throw Exception('Failed to load image: $error');
    }
  }
}