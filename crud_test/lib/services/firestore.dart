import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  // get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  // Create: add a new note
  Future<void> addNote(String note) {
    return notes.add({
      "note": note,
      "timestamp": Timestamp.now(),
    });
  }

  // Read: get notes from database
  Stream<QuerySnapshot> getNoteStream() {
    final noteStream = notes.orderBy('timestamp', descending: true).snapshots();
    return noteStream;
  }

  // Update: update notes given id
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete: delete notes givien id
  Future<void> deleteNode(docID) {
    return notes.doc(docID).delete();
  }
}
