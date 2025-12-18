import 'package:flutter/material.dart';
import 'package:flatter_test_app/data/repositories/api_interface.dart';
import 'package:flatter_test_app/domain/models/card.dart';

class MockRepository extends ApiInterface {
  @override
  Future<List<CardData>?> loadData({OnErrorCallback? onError}) async {
    return [
      CardData(
        'Спиннер',
        descriptionText: 'Ух-ты',
        imageUrl: 'https://pokupaylegko.ru/upload/shop_1/1/7/4/item_17447/shop_items_catalog_image17447.jpeg',
      ),
      CardData(
        'Попит',
        descriptionText: 'Вау',
        icon: Icons.hail,
        imageUrl: 'https://ir.ozone.ru/s3/multimedia-1/c1000/6049557961.jpg',
      ),
      CardData(
        'Сквиш',
        descriptionText: 'Ну ничего себе',
        icon: Icons.games,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPB4indgsrpoDTjQTwiNIvxuNYL5pqLCAHfA&s',
      ),
    ];
  }
}