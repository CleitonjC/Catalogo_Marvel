import 'package:marvelcatalogo/app/core/errors/custom_exception.dart';

class FetchDataException extends CustomException {
  FetchDataException(String mensagem) : super(message: mensagem);
}

class BadRequestException extends CustomException {
  BadRequestException(String mensagem) : super(message: mensagem);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(String mensagem) : super(message: mensagem);
}
