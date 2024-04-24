# REST API Client
Arsitektural yang memisahkan tampilan dengan proses bisnis
Bagian tampilan dengan proses bisnis berkirim data melalui HTTP
Request
### HTTP
Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web,pola komunikasinya  adalah :
- Client mengirim request
- Server mengolah dan membalas dengan memberi response
 ### Serialisasi dan Deserialiasi JSON
 - Serialisasi JSON adalah mengubah Map/List ke bentuk JSON dengan di Serialisasi terlebih dahalu
 - Deserialisasi JSON adalah kebalikan dari serialisasi JSON, yaitu mengubah JSON ke bentuk Map/List dengan di Deserialisasi terlebih dahalu
### Dio
Sebuah Package dari flutter sebagai HTTP CLient dan dimanfaatkan untuk melakukan REST API
### Consume REST API menggunakan DIO
#### GET
"GET" adalah untuk mengambil informasi.
```Dart
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
  ```
#### POST
"POST" adalah untuk mengirimkan informasi baru.
```Dart
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
  ```
#### PUT
"PUT" adalah untuk memperbarui informasi yang sudah ada.
```Dart
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
  ```

#### DELETE
"DELETE". adalah untuk menghapus data
```Dart
 static Future<Response> deleteBook(int id,
  ) async {
    try {
      Response response = await Dio().delete(
          'https://jsonplaceholder.typicode.com/posts/1',
        data: {
          'id': id,
        },
          );
      if (response.statusCode == 204) {
        print(response.data);
        print('berhasil hapus buku');
        return response;
      } else {
        throw Exception('Failed to delete book');
      }
    } catch (error) {
      throw Exception('Failed to delete book: $error');
    }
  }
  ```
