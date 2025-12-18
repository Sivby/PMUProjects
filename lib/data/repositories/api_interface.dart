import 'package:flatter_test_app/domain/models/card.dart';

typedef OnErrorCallback = void Function(String? error);

abstract class ApiInterface {
  Future<List<CardData>?> loadData({OnErrorCallback? onError});
}