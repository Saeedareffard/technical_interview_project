import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_question/core/repository_injectors/repo_injectors.dart';
import 'package:technical_question/models/qualification_info_model.dart';

part 'location_product_qualification_controller.g.dart';

@riverpod
class LocationProductQualificationController
    extends _$LocationProductQualificationController {
  @override
  Future<QualificationInfoModel> build(String locationId) async {
    return getProductsByLocationId(locationId);
  }

  Future<QualificationInfoModel> getProductsByLocationId(
      String locationId) async {
    state = const AsyncLoading();
    final locationProductQualificationRepository =
        ref.watch(locationProductQualificationRepositoryProvider);
    final QualificationInfoModel qualificationInfoModel =
        await locationProductQualificationRepository.getProductsByLocationId(
      locationId,
    );
    state = AsyncValue.data(qualificationInfoModel);
    return qualificationInfoModel;
  }
}
