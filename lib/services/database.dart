import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;
  DataBaseService(this.uid);
  final CollectionReference userStats =
      FirebaseFirestore.instance.collection('Scores');

  Future updateUserData(int score, int level, int time) async {
    return await userStats
        .doc(uid)
        .set({'Level': level, 'Score': score, 'Time': time});
  }
}
