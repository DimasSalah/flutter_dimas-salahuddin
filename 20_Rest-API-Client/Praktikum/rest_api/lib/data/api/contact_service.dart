import 'package:dio/dio.dart';
import 'package:rest_api/data/model/contact_model.dart';

class ContactService {
  //post data
    static Future<Response> postContact(
      String id, String name, String phone) async {
    try {
      Response response = await Dio().post(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
        data: {
          'id': id,
          'name': name,
          'phone': phone,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
          );
      if (response.statusCode == 201) {
        print(response.data);
        return response;
      } else {
        throw Exception('Failed to post person');
      }
    } catch (error) {
      throw Exception('Failed to post person: $error');
    }
  }

  //get data  
  static Future<ContactModel> fetchContact() async {
    try {
      Response response = await Dio().get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');
      if (response.statusCode == 200) {
        return ContactModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load person');
      }
    } catch (error) {
      throw Exception('Failed to load person: $error');
    }
  }

  //post data
  
}
