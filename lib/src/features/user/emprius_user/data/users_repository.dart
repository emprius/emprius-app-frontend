import 'package:empriusapp/src/core/helper/typedefs.dart';
import 'package:empriusapp/src/core/services/all_providers.dart';
import 'package:empriusapp/src/core/services/networking/api_endpoint.dart';
import 'package:empriusapp/src/core/services/networking/api_service_dio.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersRepositoryProvider = Provider<UsersRepository>(
  (ref) {
    final _apiService = ref.watch(apiServiceProvider);
    return UsersRepository(apiService: _apiService);
  },
);

class UsersRepository {
  final ApiServiceDio _apiService;

  UsersRepository({
    required ApiServiceDio apiService,
  }) : _apiService = apiService;

  // todo(kon): implement this
  // Future<List<UserModel>> fetchAll({JSON? queryParameters}) async {
  //   return _apiService.getCollectionData<UserModel>(
  //     endpoint: ApiEndpoint.students(StudentEndpoint.BASE),
  //     queryParams: queryParameters,
  //     converter: StudentModel.fromJson,
  //   );
  // }
  //
  // Future<UserModel> fetchOne({required String erp}) async {
  //   return _apiService.getDocumentData<UserModel>(
  //     endpoint: ApiEndpoint.students(StudentEndpoint.BY_ERP, erp: erp),
  //     converter: UserModel.fromJson,
  //   );
  // }

  Future<UserModel> getAuthUserProfile() async {
    return _apiService.getDocumentData<UserModel>(
        endpoint: ApiEndpoint.profile(ProfileEndpoint.BASE),
        converter: UserModel.fromJson);
  }

  Future<UserModel> update({
    required JSON data,
  }) async {
    return _apiService.updateData<UserModel>(
      endpoint: ApiEndpoint.profile(ProfileEndpoint.BASE),
      data: data,
      converter: (response) => UserModel.fromJson(response.body),
    );
  }
}
