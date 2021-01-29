import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/auth/auth_interface.dart';
import 'package:moceansdk/src/modules/abstract_client.dart';
import 'package:moceansdk/src/modules/message/channel.dart';

class SendCode extends AbstractClient {
  Channel _channel;
  bool _isResend;

  SendCode(
    AuthInterface objAuth,
    Transmitter transmitter,
  ) : super(objAuth, transmitter) {
    this._channel = Channel.AUTO;
    this._isResend = false;
  }

  set to(String value) {
    this.params['mocean-to'] = value;
  }

  set brand(String value) {
    this.params['mocean-brand'] = value;
  }

  set from(String value) {
    this.params['mocean-from'] = value;
  }

  set codeLength(String value) {
    this.params['mocean-code-length'] = value;
  }

  set pinValidity(String value) {
    this.params['mocean-pin-validity'] = value;
  }

  set nextEventWait(String value) {
    this.params['mocean-next-event-wait'] = value;
  }

  set reqId(String value) {
    this.params['mocean-reqid'] = value;
  }

  set sendAs(Channel channel) {
    this._channel = channel;
  }

  Future send([Map params]) async {
    if (params != null) {
      this.create(params);
    }
    this.isRequiredFieldSet();

    String sendCodeUrl = '/verify';
    if (this._isResend) {
      sendCodeUrl += '/resend';
    } else {
      sendCodeUrl += '/req';
    }

    if (this._channel == Channel.SMS) {
      sendCodeUrl += '/sms';
    } else if (this._channel == Channel.TELEGRAM) {
      sendCodeUrl += '/telegram';
    }

    return await this.transmitter.post(sendCodeUrl, this.params);
  }

  Future resend([Map params]) async {
    this
      .._isResend = true
      ..sendAs = Channel.SMS;
    return this.send(params);
  }

  @override
  List requiredKey() {
    var requiredKey = super.requiredKey();
    if (this._isResend) {
      requiredKey.addAll(['mocean-reqid']);
    } else {
      requiredKey.addAll(['mocean-to', 'mocean-brand']);
    }
    return requiredKey;
  }
}
