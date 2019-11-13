class MoceanErrorException implements Exception {
  String _errMsg;
  Map _errorResponse;

  MoceanErrorException(this._errMsg, [this._errorResponse]);

  Map get errorResponse => this._errorResponse;

  String toString() {
    if (this._errMsg == null) {
      return this.runtimeType.toString();
    }

    return "${this.runtimeType.toString()}: ${this._errMsg}";
  }
}
