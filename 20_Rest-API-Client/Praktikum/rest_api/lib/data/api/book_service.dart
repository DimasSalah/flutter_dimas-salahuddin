import 'package:dio/dio.dart';

class BookService {
  static Future<Response> putBook(int id,
      int userId, String title, String body
  ) async {
    try {
      Response response = await Dio().put(
          'https://jsonplaceholder.typicode.com/posts/1',
        data: {
          'id': id,
          'userId': userId,
          'title': title,
          'author': body,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
          );
      if (response.statusCode == 200) {
        print(response.data);
        print('berhasil');
        return response;
      } else {
        throw Exception('Failed to put book');
      }
    } catch (error) {
      throw Exception('Failed to put book: $error');
    }
    
  }
}