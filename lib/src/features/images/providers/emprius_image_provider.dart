import 'package:empriusapp/src/core/shared/states/future_state.codegen.dart';
import 'package:empriusapp/src/features/images/models/emprius_image.dart';
import 'package:empriusapp/src/features/images/repositories/emprius_image_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final empriusImageProvider = Provider<EmpriusImageProvider>((ref) {
  final _imageRepository = ref.watch(empriusImageRepositoryProvider);
  return EmpriusImageProvider(
    imageRepository: _imageRepository,
  );
});

final empriusImageFutureProvider = FutureProvider.family.autoDispose<EmpriusImageModel, String>(
      (ref, hash) async => ref.watch(empriusImageProvider).getImage(hash),
);

class EmpriusImageProvider {
  final EmpriusImageRepository _imageRepository;

  EmpriusImageProvider({
    required EmpriusImageRepository imageRepository,
  }) : _imageRepository = imageRepository;

  Future<EmpriusImageModel> getImage(String hash) async {
    return _imageRepository.fetchOne(hash: hash);
  }
}
