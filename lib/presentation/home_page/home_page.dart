import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flatter_test_app/domain/models/card.dart';
import 'package:flatter_test_app/presentation/details_page/details_page.dart';

part 'card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _color = Colors.orangeAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(widget.title),
      ),
      body: const Body(),
    );
  }
}




class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
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
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((data) {
            return _Card.fromData(
              data,
              onLike: (String title, bool isLiked) =>
                  _showSnackBar(context, title, isLiked),
              onTap: () => _navToDetails(context, data),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _navToDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailsPage(data)),
    );
  }

  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Игрушка $title ${isLiked ? 'liked!' : 'disliked :('}',
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge,
        ),
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(seconds: 1),
      ));
    });
  }
}


