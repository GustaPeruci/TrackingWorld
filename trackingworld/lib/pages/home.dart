import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<TravelItem> TravelItems = [
      TravelItem(
          image: 'assets/mont1.jpg',
          title: 'Mountain Snowdon Horn',
          price: '\$56B'),
      TravelItem(
          image: 'assets/mont2.jpg',
          title: 'Mattern Horn Jungle',
          price: '\$8B'),
      TravelItem(
          image: 'assets/mont3.jpg',
          title: 'Volcanic Mount Rainier',
          price: '\$32B'),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(),
                    ),
                    SizedBox(width: 16),
                    Text("em",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    SizedBox(width: 50),
                    Icon(Icons.apps),
                    SizedBox(width: 16),
                    Icon(Icons.view_list),
                    SizedBox(width: 16),
                    Icon(Icons.format_align_justify),
                    SizedBox(width: 16),
                    Icon(Icons.fmd_good_outlined),
                    SizedBox(width: 80),
                    DropdownButton<String>(
                      items: ['Filtro 1', 'Filtro 2', 'Filtro 3'].map(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? value) {},
                      hint: Text('Filtros'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: TravelItems.length,
        itemBuilder: (context, index) {
          final item = TravelItems[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      item.image,
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            item.isFavorite = !item.isFavorite;
                          });
                        },
                        child: Icon(
                          item.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: item.isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Text(
                        item.price,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'OpenSans',
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'OpenSans',
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/profile');
        },
        child: Center(
          child: Icon(Icons.account_circle, color: Color(0x97C4BEBE)),
        ),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TravelItem {
  final String image;
  final String title;
  final String price;
  bool isFavorite;

  TravelItem(
      {required this.image,
      required this.title,
      required this.price,
      this.isFavorite = false});
}
