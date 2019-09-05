import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiData{
  Future<Map> getHeaderData() async{
    String url = 'http://api.prevmais.3itconsultoria.com.br/usuario/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"usuario":{"username":"apresentacao","password":"12345678"}}';
    http.Response response = await http.post(url, headers: headers, body: json);
    int statusCode = response.statusCode;

    var finalHeaders = {
      "uid":response.headers["uid"],
      "client":response.headers["client"],
      "access-token":response.headers["access-token"],
    };

    return finalHeaders;
  }

  Future<Map<String, dynamic>> getApiData() async{
    final headerData = await getHeaderData();

    const baseUrl = "http://api.prevmais.3itconsultoria.com.br/";

    var apiUrl = "http://api.prevmais.3itconsultoria.com.br//dashservidores/listarDadosQtdServidores/";
    
    Map<String, String> headers = {"uid": headerData["uid"], "client":headerData["client"],"access-token":headerData["access-token"]};

    http.Response response = await http.get(apiUrl, headers: headers);

    var teste = response.body;
    var finalResponse = {
      "Efetivos":json.decode(response.body)[0],
      "Aposentados":json.decode(response.body)[1],
      "Pensionistas":json.decode(response.body)[2],
    };

    return finalResponse;

  }
}