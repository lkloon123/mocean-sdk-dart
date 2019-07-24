import 'package:moceansdk/src/exception/mocean_error_exception.dart';
import 'package:moceansdk/src/exception/required_field_exception.dart';
import 'package:moceansdk/src/modules/account/balance.dart';
import 'package:moceansdk/src/modules/account/pricing.dart';
import 'package:moceansdk/src/modules/message/message_status.dart';
import 'package:moceansdk/src/modules/message/send_code.dart';
import 'package:moceansdk/src/modules/message/sms.dart';
import 'package:moceansdk/src/modules/message/verify_code.dart';
import 'package:moceansdk/src/modules/number_lookup/number_lookup.dart';
import 'package:moceansdk/src/modules/transmitter.dart';
import 'package:moceansdk/src/utils.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';

class Mocean {
  AuthInterface _objAuth;
  Transmitter _transmitter;

  Mocean(AuthInterface objAuth, [Transmitter transmitter]) {
    transmitter ??= Transmitter();

    this._objAuth = objAuth;
    this._transmitter = transmitter;

    if (this._objAuth.getAuthMethod() == 'basic') {
      if (Utils.isNullOrEmpty(this._objAuth.getParams()['mocean-api-key']) ||
          Utils.isNullOrEmpty(this._objAuth.getParams()['mocean-api-secret'])) {
        throw RequiredFieldException("api key and api secret can't be empty");
      }
    } else {
      throw MoceanErrorException('unsupported auth method');
    }
  }

  Balance get balance => Balance(this._objAuth, this._transmitter);

  Pricing get pricing => Pricing(this._objAuth, this._transmitter);

  Sms get sms => Sms(this._objAuth, this._transmitter);

  MessageStatus get messageStatus =>
      MessageStatus(this._objAuth, this._transmitter);

  SendCode get sendCode => SendCode(this._objAuth, this._transmitter);

  VerifyCode get verifyCode => VerifyCode(this._objAuth, this._transmitter);

  NumberLookup get numberLookup =>
      NumberLookup(this._objAuth, this._transmitter);
}
