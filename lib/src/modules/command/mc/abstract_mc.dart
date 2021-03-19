import 'package:moceansdk/moceansdk.dart';
import 'package:moceansdk/src/utils.dart';

abstract class AbstractMc {
  Map<String, dynamic> params;

  AbstractMc([Map<String, dynamic> params]) {
    params ??= Map<String, dynamic>();
    this.params = params;
  }

  Map<String, dynamic> get requestData {
    for (var required in this.requiredKey()) {
      if (Utils.isNullOrEmpty(this.params[required])) {
        throw RequiredFieldException(
          "${required} is mandatory field, can't be empty (${this.runtimeType.toString()})",
        );
      }
    }

    this.params['action'] = this.action();
    return this.params;
  }

  List<String> requiredKey();

  String action();
}
