import 'package:technical_question/constants/api_constants.dart';

class Pagination<T> {
  final List<T> items;
  final int itemsPerPage;
  int _currentPage = 1;

  Pagination({required this.items, int? itemsPerPage})
      : itemsPerPage = itemsPerPage ?? ApiConstants.paginationSize;

  List<T> get currentItems {
    const start = 0;
    var end = _currentPage * itemsPerPage;
    if (end > items.length) end = items.length;
    return items.sublist(start, end);
  }

  bool get hasNextPage => _currentPage * itemsPerPage < items.length;

  void next() {
    if (hasNextPage) _currentPage++;
  }
}
