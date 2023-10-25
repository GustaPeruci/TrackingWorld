import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:com.example.trackingworld/services/firestore.dart';
import '../colors.dart';

class TravelPostPage extends StatefulWidget {
  const TravelPostPage({Key? key});

  @override
  State<TravelPostPage> createState() => _TravelPostState();
}

const List<String> options = <String>[
  'Filtro 1',
  'Filtro 2',
  'Filtro 3',
];

class _TravelPostState extends State<TravelPostPage> {
  String dropdownValue = options.first;
  // firestore
  final FirestoreService firestoreService = FirestoreService();

  // text controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imagemController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  // open a dialog vox to add a note
  void openNoteBox({String? docID, Map<String, dynamic>? data}) {
    if (data != null) {
      nameController.text = data['nome'] ?? '';
      imagemController.text = data['imagem'] ?? '';
      descricaoController.text = data['descricao'] ?? '';
      valorController.text = data['valor'] ?? '';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: imagemController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: valorController,
              decoration: InputDecoration(labelText: 'Value'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null || docID.isEmpty) {
                firestoreService.addNote(
                  nameController.text,
                  imagemController.text,
                  descricaoController.text,
                  valorController.text,
                );
              } else {
                firestoreService.updateNote(
                  docID,
                  nameController.text,
                  imagemController.text,
                  descricaoController.text,
                  valorController.text,
                );
              }

              nameController.clear();
              imagemController.clear();
              descricaoController.clear();
              valorController.clear();

              Navigator.pop(context);
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                      ),
                      splashRadius: 20,
                    ),
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.apps),
                      splashRadius: 20,
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.view_list),
                      splashRadius: 20,
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.format_align_justify),
                      splashRadius: 20,
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.fmd_good_outlined),
                      splashRadius: 20,
                    ),
                    SizedBox(width: 80),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: kTwGray900),
                      underline: Container(
                        height: 2,
                        color: kTwGray900,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: ['Filtro 1', 'Filtro 2', 'Filtro 3'].map(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onLongPress: () {
          Navigator.of(context).pushNamed('/profile');
        },
        child: FloatingActionButton(
          onPressed: openNoteBox,
          child: const Icon(Icons.add),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          // if have data, get all the docs
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            // display as a list
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docID = document.id;
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String nome = data['nome'];
                String imagem = data['imagem'];
                String descricao = data['descricao'];
                String valor = data['valor'];

                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                imagem,
                                width: double.infinity,
                                height: 400.0,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  ('\$' + valor + 'B'),
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'OpenSans',
                                      color: Colors.white),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          openNoteBox(docID: docID, data: data),
                                      icon: const Icon(Icons.settings),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          firestoreService.deleteNote(docID),
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              nome,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          descricao,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text("No notes...");
          }
        },
      ),
    );
  }
}
