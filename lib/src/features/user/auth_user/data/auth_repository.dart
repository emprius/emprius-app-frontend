import 'package:empriusapp/src/core/helper/typedefs.dart';
import 'package:empriusapp/src/core/services/all_providers.dart';
import 'package:empriusapp/src/core/services/networking/api_endpoint.dart';
import 'package:empriusapp/src/core/services/networking/api_service_dio.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final _apiService = ref.watch(apiServiceProvider);
  return AuthRepository(apiService: _apiService);
});

class AuthRepository {
  final ApiServiceDio _apiService;

  AuthRepository({required ApiServiceDio apiService}) : _apiService = apiService;

  Future<bool> sendLoginData({
    required JSON data,
    required void Function(String newToken) updateTokenCallback,
  }) async {
    return _apiService.setData<bool>(
      endpoint: ApiEndpoint.auth(AuthEndpoint.LOGIN),
      data: data,
      requiresAuthToken: false,
      converter: (response) {
        updateTokenCallback(response.body['token'] as String);
        return true;
      },
    );
  }

  Future<bool> sendRegisterData({
    required JSON data,
    required void Function(String newToken) updateTokenCallback,
  }) async {
    return _apiService.setData<bool>(
      endpoint: ApiEndpoint.auth(AuthEndpoint.REGISTER),
      data: data,
      requiresAuthToken: false,
      converter: (response) {
        updateTokenCallback(response.body['token'] as String);
        return true;
      },
    );
  }
}
