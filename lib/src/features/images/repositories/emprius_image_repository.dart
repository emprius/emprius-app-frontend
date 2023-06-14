import 'package:empriusapp/src/core/helper/typedefs.dart';
import 'package:empriusapp/src/core/services/all_providers.dart';
import 'package:empriusapp/src/core/services/networking/api_endpoint.dart';
import 'package:empriusapp/src/core/services/networking/api_service_dio.dart';
import 'package:empriusapp/src/core/services/networking/dio_service.dart';
import 'package:empriusapp/src/features/images/models/emprius_image.dart';
import 'package:empriusapp/src/features/images/providers/emprius_image_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final empriusImageRepositoryProvider = Provider<EmpriusImageRepository>(
  (ref) {
    final _apiService = ref.watch(apiServiceProvider);
    return EmpriusImageRepository(apiService: _apiService);
  },
);

class EmpriusImageRepository {
  final ApiServiceDio _apiService;

  EmpriusImageRepository({
    required ApiServiceDio apiService,
  }) : _apiService = apiService;

  Future<EmpriusImageModel> fetchOne({required String hash}) async {
    return _apiService.getDocumentData<EmpriusImageModel>(
      endpoint: ApiEndpoint.images(ImagesEndpoint.GET, hash: hash),
      converter: EmpriusImageModel.fromJson,
    );
  }
}
