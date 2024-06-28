import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  Future<String?> apiCalling() async {
    String json = 'https://api.chucknorris.io/jokes/random?_gl=1*1kk9gcc*_ga*MzMxNzI1NjguMTcxOTQ3OTQ1OQ..*_ga_ZCYG64C7PL*MTcxOTU2MzM3NS4yLjEuMTcxOTU2NDAyMS4wLjAuMA..';
    Response response = await http.get(Uri.parse(json));

    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return null;
    }
  }
}