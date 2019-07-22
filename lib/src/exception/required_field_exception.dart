import 'package:moceansdk/src/exception/mocean_error_exception.dart';

class RequiredFieldException extends MoceanErrorException {
  RequiredFieldException(String errMsg) : super(errMsg);
}
