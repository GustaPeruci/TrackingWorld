import 'package:flutter/material.dart';
import '../colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Gustavo C. Assis',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'gustavosss06@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(textStyle: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/favorites');
                  },
                  child: const Text(
                    'Curtidas',
                    style: TextStyle(color: kTwGray900),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(textStyle: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/settings');
                  },
                  child: const Text(
                    'Configurações',
                    style: TextStyle(color: kTwGray900),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  color: Colors.grey,
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(textStyle: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/travelPost');
                  },
                  child: const Text(
                    'Posts',
                    style: TextStyle(color: kTwGray900),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
        child: Center(
          child: Icon(Icons.map, color: Color(0x97C4BEBE)),
        ),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
