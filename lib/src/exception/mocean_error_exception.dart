class MoceanErrorException implements Exception {
  String errMsg;

  MoceanErrorException(this.errMsg);

  String toString() {
    if (errMsg == null) return this.runtimeType.toString();
    return "${this.runtimeType.toString()}: ${errMsg}";
  }
}
