

import 'package:my_appls/models/api_response/paging_data.dart';
import 'package:my_appls/models/article.dart';
import 'package:my_appls/models/login_params.dart';
import 'package:my_appls/models/paging_request.dart';
import 'package:my_appls/models/user_entity.dart';
import 'package:my_appls/templateProject/request/apis.dart';
import 'package:my_appls/templateProject/request/request_client.dart';
import 'package:get/get.dart';

class ApiService extends GetxService{


  Future<UserEntity?> login(LoginParams params, {onError}){
    return requestClient.post<UserEntity>(APIS.login, data: params, onError: onError);
  }

  Future<UserEntity?> loginError(LoginParams params, {onError}){
    return requestClient.post<UserEntity>(APIS.loginErr, data: params, onError: onError);
  }

  Future<UserEntity?> test(){
    return requestClient.post<UserEntity>(APIS.test);
  }
  
  Future<PagingData<Article>?> getArticleList(PagingParams pagingRequest) async{
    return await requestClient.get<PagingData<Article>>(APIS.articles);
  }
}