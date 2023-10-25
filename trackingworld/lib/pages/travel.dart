import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:favorite_button/favorite_button.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Mountain Snowdon Horn'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          Stack(
            children: [
              Image.asset(
                'assets/mont1.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: FavoriteButton(
                    iconSize: 50,
                    iconDisabledColor: Colors.white,
                    valueChanged: (_isFavorite) {
                      setState(() {
                        isFavorite = _isFavorite;
                      });
                    }),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  ('\$56B'),
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
            padding: EdgeInsets.all(16.0),
            child: Text('Postado por: Pedro'),
          ),
          ListTile(
            title: Text('Sobre Snowdown Horn'),
            subtitle: Text(
              'Snowdown Horn é um cume de montanha no Ilfracombe para a região de Quantocks e Sidmouth, no condado de Somerset, Inglaterra. Horn Hill tem 80 metros de altura com uma proeminência de 41 metros. O cume pode ser identificado por: nenhuma característica: solo c 2m S de ponto trig Notas adicionais: Todas as caminhadas até Horn Hill em Mud and Routes podem ser vistas acima.',
            ),
          ),
          ListTile(
            title: Text('Estatísticas'),
            subtitle: Text(
                'Altura em metros: 80\nProeminência em metros: 41\nCoordenadas: 51° 10′ 48″ N, 3° 32′ 24″ O'),
          ),
          Container(
            height: 60,
            width: 60,
            child: const TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Comentário',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
