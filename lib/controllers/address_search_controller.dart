import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_question/core/pagination/pagination.dart';
import 'package:technical_question/core/repository_injectors/repo_injectors.dart';
import 'package:technical_question/models/address_model.dart';
import 'package:technical_question/models/address_search_data.dart';

part 'address_search_controller.g.dart';

@riverpod
class AddressSearchController extends _$AddressSearchController {
  Pagination<AddressModel>? _pagination;
  List<AddressModel> _allItems = [];

  @override
  Future<AddressSearchData> build() async =>
      const AddressSearchData(addresses: []);

  Future<void> searchAddress(String address) async {
    try {
      final list =
          await ref.read(addressSearchRepoProvider).searchAddress(address);
      _allItems = list;
      _pagination = Pagination(items: _allItems);
      state = AsyncValue.data(
        AddressSearchData(addresses: _pagination!.currentItems),
      );
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> loadNextPage() async {
    if (_pagination == null || !_pagination!.hasNextPage) return;

    state = AsyncValue.data(
      AddressSearchData(
        addresses: _pagination!.currentItems,
        isLoadingMore: true,
      ),
    );

    await Future.delayed(const Duration(milliseconds: 500));

    _pagination!.next();

    state = AsyncValue.data(
      AddressSearchData(
        addresses: _pagination!.currentItems,
        isLoadingMore: false,
      ),
    );
  }
}
