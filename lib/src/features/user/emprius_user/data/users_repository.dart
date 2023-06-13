
import 'package:empriusapp/src/core/helper/typedefs.dart';
import 'package:empriusapp/src/core/services/all_providers.dart';
import 'package:empriusapp/src/core/services/networking/api_endpoint.dart';
import 'package:empriusapp/src/core/services/networking/api_service_dio.dart';
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
  // Future<StudentModel> fetchOne({required String erp}) async {
  //   return _apiService.getDocumentData<StudentModel>(
  //     endpoint: ApiEndpoint.students(StudentEndpoint.BY_ERP, erp: erp),
  //     converter: StudentModel.fromJson,
  //   );
  // }

  Future<String> update({
    required JSON data,
  }) async {
    return _apiService.updateData<String>(
      endpoint: ApiEndpoint.profile(ProfileEndpoint.BASE),
      data: data,
      // converter: (response) => response.headers.message,
      converter: (response) {
        print("todo(kon): implement response headers");
        return "todo";
      },
    );
  }
}
