import 'package:moceansdk/moceansdk.dart';

void main() async {
  //setup your credentials
  var basicCredentials = Basic('your_api_key', 'your_api_secret');

  //create a mocean object using the credentials
  var mocean = Mocean(basicCredentials);

  //get account balance
  await mocean.balance.inquiry();

  //get account pricing
  await mocean.pricing.inquiry();

  //send sms
  await mocean.sms.send({
    'mocean-to': '60123456789',
    'mocean-from': 'yourname',
    'mocean-text': 'sample text'
  });

  //get message status
  await mocean.messageStatus
      .inquiry({'mocean-msgid': 'the msg id get from sms response'});

  //send otp code
  await mocean.sendCode
      .send({'mocean-to': '60123456789', 'mocean-brand': 'yourbrand'});

  //verify otp code
  await mocean.verifyCode.send({
    'mocean-reqid': 'the req id get from send otp response',
    'mocean-code': 'the code'
  });

  //perform number lookup
  await mocean.numberLookup.inquiry({'mocean-to': '60123456789'});
}
