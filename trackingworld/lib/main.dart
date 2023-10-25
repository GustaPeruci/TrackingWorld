import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore.instance
      .collection('usuarios')
      .doc('alunos')
      .set({'Nome': 'Gustavo', 'Sobrenome': 'Assis'});

  runApp(const TrackingWorldApp());
}
