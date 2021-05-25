import 'dart:convert';
import 'dart:io';
import 'package:convert/convert.dart';
import 'package:marvelcatalogo/app/core/consts/api_consts.dart';
import 'package:marvelcatalogo/app/core/errors/http_errors.dart';

import 'package:marvelcatalogo/app/core/http/http_provider.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

class HttpProviderImpl implements HttpProvider {
  @override
  Future fetch(String url, Map<String, dynamic>? parametros) async {
    var result;
    try {
      final parametrosAuth = _gerarParametrosEspeciais();
      if (parametros != null) {
        parametros.addAll(parametrosAuth);
      } else {
        parametros = parametrosAuth;
      }
      final urlCompleta = Uri.https(ApiConsts.baseUrl, url, parametros);
      final response = await http.get(urlCompleta);
      result = _response(response);
    } on SocketException {
      throw FetchDataException('Sem conexão com a internet');
    } on Exception {
      throw FetchDataException('Erro não identificado');
    }
    return result;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
        throw BadRequestException(response.body);
      default:
        throw FetchDataException(
          'Ocorreu um erro durante a comunicação com o servidor',
        );
    }
  }

  String _gerarMd5Hash(String data) {
    return hex.encode(crypto.md5.convert(Utf8Encoder().convert(data)).bytes);
  }

  Map<String, String> _gerarParametrosEspeciais() {
    final agoraEmMilisegundos =
        DateTime.now().microsecondsSinceEpoch.toString();
    return {
      'apikey': ApiConsts.apiKeyPublica,
      'ts': agoraEmMilisegundos,
      'hash': _gerarMd5Hash(
          '$agoraEmMilisegundos${ApiConsts.apikeyPrivada}${ApiConsts.apiKeyPublica}')
    };
  }
}
