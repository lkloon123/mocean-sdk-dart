MoceanAPI Client Library for Dart
============================
[![Latest Stable Version](https://img.shields.io/pub/v/moceansdk.svg)](https://pub.dev/packages/moceansdk)
[![build](https://github.com/MoceanAPI/mocean-sdk-dart/actions/workflows/build.yml/badge.svg)](https://github.com/MoceanAPI/mocean-sdk-dart/actions/workflows/build.yml)
[![codecov](https://img.shields.io/codecov/c/github/MoceanAPI/mocean-sdk-dart.svg)](https://codecov.io/gh/MoceanAPI/mocean-sdk-dart)
[![MIT license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

This is the Dart library for use Mocean's API. To use this, you'll need a Mocean account. Sign up [for free at 
moceanapi.com][signup].

 * [Installation](#installation)
 * [Usage](#usage)
 * [Example](#example)
 
## Installation

To install the client

1. add `moceansdk` to your `pubspec.yaml`

```yaml
name: my_app
dependencies:
  moceansdk: ^1.0.0
```

2. run `pub get`

## Usage

Create a client with your API key and secret

```dart
import 'package:moceansdk/moceansdk.dart';

var mocean = Mocean(
  Basic('your api key', 'your api secret')
);
```

## Available API
```dart
mocean.balance.inquiry();       //Get Account Balance
mocean.pricing.inquiry();       //Get Account Pricing
mocean.sms.send();              //Send SMS
mocean.messageStatus.inquiry(); //Get Message Status
mocean.sendCode.send();         //Send Verify Code
mocean.verifyCode.send();       //Check Verify Code
mocean.numberLookup.inquiry();  //Number Lookup
mocean.voice.call();            //Voice
```

## Example

To use [Mocean's SMS API][doc_sms] to send an SMS message, call the `mocean.sms.send()` method.

The API can be called directly, using a simple array of parameters, the keys match the [parameters of the API][doc_sms].

```dart
import 'package:moceansdk/moceansdk.dart';
  
var mocean = Mocean(
  Basic('MOCEAN_API_KEY', 'MOCEAN_API_SECRET')
);

void main() async {
  var res = await mocean.sms.send({
    'mocean-to': '60123456789',
    'mocean-text': 'hello world testing dart',
    'mocean-from': 'MoceanAPI'
  });

  var result = res['messages'][0];

  print(result);
  print(result['status']);
  print(result['msgid']);
  print(result['receiver']);
}
```

##### *All calls will return `Future` object

## Responses

For your convenient, the API response has been parsed to `Map`

```dart
print(res);           // show full response string
print(res['messages'][0]['status']); // show response status, '0' in this case
```

## Documentation

Kindly visit [MoceanApi Docs][doc_main] for more usage

## License

This library is released under the [MIT License][license]

[signup]: https://dashboard.moceanapi.com/register?medium=github&campaign=sdk-go
[doc_main]: https://moceanapi.com/docs/?dart
[doc_sms]: https://moceanapi.com/docs/?dart#send-sms
[license]: LICENSE.txt
