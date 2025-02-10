import 'package:technical_question/models/address_model.dart';

class AddressSearchData {
  final List<AddressModel> addresses;
  final bool isLoadingMore;
  const AddressSearchData(
      {required this.addresses, this.isLoadingMore = false});
}
