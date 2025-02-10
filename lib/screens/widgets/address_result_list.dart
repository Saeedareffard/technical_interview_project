import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_question/controllers/address_search_controller.dart';
import 'address_result_list_item.dart';

class AddressResultList extends ConsumerStatefulWidget {
  const AddressResultList({super.key});

  @override
  ConsumerState<AddressResultList> createState() => _AddressResultListState();
}

class _AddressResultListState extends ConsumerState<AddressResultList> {
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() async {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - 200) {
      await ref.read(addressSearchControllerProvider.notifier).loadNextPage();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addressSearchControllerProvider);
    return state.when(
      data: (data) {
        if (data.addresses.isEmpty && !data.isLoadingMore) {
          return const Center(child: Text('No addresses found'));
        }
        return ListView.builder(
          controller: _scrollController,
          itemCount: data.addresses.length + (data.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < data.addresses.length) {
              return AddressResultListItem(
                address: data.addresses[index],
                onTap: () {},
              );
            }
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) {
        if (error.toString().contains('404')) {
          return const Center(child: Text('No addresses found'));
        }
        return Center(child: Text('Error: $error'));
      },
    );
  }
}
