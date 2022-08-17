

import 'package:empriusapp/features/user/models/user_model.dart';

class UserHttpRepository {
  // todo(kon): implement http service provider
  // final HttpService httpService;
  // HttpPeopleRepository(this.httpService);

  String get path => '/user';

  Future<UserModel> register({
    required UserModel userData,
    required String password,
    required String invite
  }) async {
    // todo(kon): implement http service provider
    // return await _apiService.setData<UserModel>(
    //   endpoint: ApiEndpoint.auth(AuthEndpoint.REGISTER),
    //   data: data,
    //   requiresAuthToken: false,
    //   converter: (response) {
    //     updateTokenCallback(response['body']['token'] as String);
    //     data['user_id'] = response['body']['user_id'];
    //     return UserModel.fromJson(data);
    //   },
    // );
    return userData.copyWith(id: 1);
  }
}
