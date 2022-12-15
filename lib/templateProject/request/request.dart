

import 'package:my_appls/templateProject/request/config.dart';
import 'package:my_appls/templateProject/request/exception.dart';
import 'package:my_appls/templateProject/request/exception_handler.dart';
import 'package:my_appls/templateProject/utils/loading.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future request(Function() block,  {bool showLoading = true, bool Function(ApiException)? onError, }) async{
  try {
    await loading(block, isShowLoading:  showLoading);
  } catch (e) {
    handleException(ApiException.from(e), onError: onError);
  }
  return;
}