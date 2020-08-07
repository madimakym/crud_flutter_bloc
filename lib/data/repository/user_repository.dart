import 'package:http/http.dart' as http;

class UserRepository {
  Future<http.Response> createUser(firstname, lastname) async {
      var data = {
          "firstname": firstname,
          "lastname": lastname
      };
    try {
      var url = 'http://localhost:5555/users';
      print('post endpoint: $url');
      print('post data: $data');
      var response = await http.post('$url',body: data);
      return response;
    } catch (e) {
      return e;
    }
  } 

  Future<http.Response> readUser() async {
    try {
      var url = 'http://localhost:5555/users';
      print('post endpoint: $url');
      var response = await http.get('$url');
      return response;
    } catch (e) {
      return e;
    }
  }
}
