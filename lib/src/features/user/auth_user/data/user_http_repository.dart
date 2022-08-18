import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';

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

    // How to create the dto object
    // option 1
    // var userDto = {
    //   userData: userData,
    //   password: password,
    //   invite: invite
    // };
    // final responseData = await httpService.post(
    //   '$path/',
    //   body: jsonEncode(userDto)
    // );

    // option 2
    // Implement something like
    // @freezed
    // class UserRegisterDto {
    //  UserModel userData,
    //  String password,
    //  String invite
    // }

    return userData.copyWith(userId: 1);
  }

  // todo: implement
  Future<UserModel> login({required String email, required String password}) =>
      throw UnimplementedError();

  // todo: implement
  Future<UserModel> userUpdate({required UserModel user}) =>
      throw UnimplementedError();
}
