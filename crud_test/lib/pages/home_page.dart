import "package:cloud_firestore/cloud_firestore.dart";
import "package:crud_test/services/firestore.dart";
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// firestore service
  final FireStoreService fireStoreService = FireStoreService();

// text controller
  final TextEditingController textController = TextEditingController();

// open a dialog vox to add a note
  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                //button to save
                ElevatedButton(
                    onPressed: () {
                      // add new note
                      if (docID == null) {
                        fireStoreService.addNote(textController.text);
                      }

                      // update existing node
                      else {
                        fireStoreService.updateNote(docID, textController.text);
                      }

                      // clear the text controller
                      textController.clear();
                      // close the box
                      Navigator.pop(context);
                    },
                    child: const Text("Add"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: fireStoreService.getNoteStream(),
          builder: (context, snapshot) {
            // if we have date get all the docs
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;

              //display as a list
              return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    // get each individual doc
                    DocumentSnapshot document = notesList[index];
                    // ignore: unused_local_variable
                    String docID = document.id;

                    // get note from each doc
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noteText = data['note'];

                    // display as a list tile
                    return ListTile(
                        title: Text(noteText),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => openNoteBox(docID: docID),
                              icon: const Icon(Icons.settings),
                            ),
                            IconButton(
                              onPressed: () =>
                                  fireStoreService.deleteNode(docID),
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ));
                  });
            }
            // if there is no data return nothing
            else {
              return const Text('No Notes...');
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
