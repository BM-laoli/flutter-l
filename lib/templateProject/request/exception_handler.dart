import 'package:my_appls/templateProject/request/exception.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// 业务错误处理
bool handleException(ApiException exception,
    {bool Function(ApiException)? onError}) {
  if (onError?.call(exception) == true) {
    return true;
  }

  if (exception.code == 401) {
    ///todo to login
    return true;
  }
  EasyLoading.showError(exception.message ?? ApiException.unknownException);

  return false;
}
