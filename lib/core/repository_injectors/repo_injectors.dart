import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_question/core/network_handlers/dio_provider.dart';
import 'package:technical_question/repositories/address_search_repository_impl.dart';
import 'package:technical_question/repositories/base_address_search_repo.dart';
import 'package:technical_question/repositories/base_location_product_qualification_repository.dart';
import 'package:technical_question/repositories/location_product_qualification_repository.dart';

final addressSearchRepoProvider = Provider<BaseAddressSearchRepo>((ref) {
  final dio = ref.watch(dioProvider);
  return AddressSearchRepositoryImpl(dio: dio);
});
final locationProductQualificationRepositoryProvider =
    Provider<BaseLocationProductQualificationRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return LocationProductQualificationRepositoryImpl(dio: dio);
});
