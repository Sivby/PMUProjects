import 'package:flatter_test_app/domain/models/card.dart';

abstract class ApiInterface {
  Future<List<CardData>?> loadData();
}