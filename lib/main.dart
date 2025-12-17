import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Суслин В.С. ПИбд-33'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const MyWidget(),
           );
  }
}


class _CardData {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;

  _CardData(
      this.text, {
      this.icon = Icons.access_alarms_outlined,
      required this.descriptionText,
      this.imageUrl,
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      _CardData(
        'Спиннер',
        descriptionText: 'Ух-ты',
        imageUrl: 'https://pokupaylegko.ru/upload/shop_1/1/7/4/item_17447/shop_items_catalog_image17447.jpeg',
      ),
      _CardData(
        'Попит',
        descriptionText: 'Вау',
        icon: Icons.hail,
        imageUrl: 'https://ir.ozone.ru/s3/multimedia-1/c1000/6049557961.jpg',
      ),
      _CardData(
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
          children: data.map((e) => _Card.fromData(e)).toList(),
        ),
      ),
    );
  }
}

class _Card extends StatefulWidget {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;


  const _Card(
      this.text, {
      this.icon = Icons.access_alarm_outlined,
      required this.descriptionText,
      this.imageUrl,
  });

  factory _Card.fromData(_CardData data) => _Card(
      data.text,
      descriptionText: data.descriptionText,
      icon: data.icon,
      imageUrl: data.imageUrl,
    );

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 4,
            offset: const Offset(0, 5),
            blurRadius: 8,
          ),
        ],
      ),

      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: SizedBox(
                height: 140,
                width: 100,
                child: Image.network(widget.imageUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Placeholder(),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      widget.descriptionText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 16,
                    bottom: 16,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isLiked
                            ? const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                              key: ValueKey<int>(0),
                        )
                            : const Icon(Icons.favorite_border),
                              key: ValueKey<int>(1),
                        ),
                      ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
