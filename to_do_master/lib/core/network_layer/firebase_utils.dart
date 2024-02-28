import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/provider/app_provider.dart';
import '../../core/utils/extract_date.dart';
import '../../model/task_model.dart';

class FirebaseUtils {
  static Future<Either<String?, UserCredential>> register(
    String email,
    String password,
  ) async {
    late UserCredential user;
    try {
      user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await verifyEmail();
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
    return Right(user);
  }

  static Future<Either<String, UserCredential>> logIn(
    String email,
    String password,
  ) async {
    late UserCredential user;
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      return Left(e.code);
    }
    return Right(user);
  }

  static logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  static String getCurrentUserEmail() {
    try {
      String email = FirebaseAuth.instance.currentUser!.email!;
      return email;
    } on FirebaseAuthException catch (e) {
      return (e.code);
    }
  }

  static Future<String> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return "success";
  }

  static Future<String> deleteAccount() async {
    try {
      await deleteDataFromFirestore();
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return "success";
  }

  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection(AppProvider.userID)
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromFirestore(snapshot.data()!),
          toFirestore: (task, _) => task.toFirestore(),
        );
  }

  static Future<void> addTaskToFirestore(TaskModel task) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Future<void> deleteTaskFromFirestore(TaskModel task) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc(task.id);
    return docRef.delete();
  }

  static Future<void> updateTaskOnFirestore(TaskModel task) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc(task.id);
    return docRef.update(task.toFirestore());
  }

  static Future<List<TaskModel>> getDataFromFirestore() async {
    var snapshot = await getCollection().get();
    return snapshot.docs.map((element) => element.data()).toList();
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeDataFromFirestore(
      DateTime date) {
    var reqDate = ExtractDate.extractDate(date);
    var snapshot = getCollection()
        .where('date', isEqualTo: reqDate.millisecondsSinceEpoch)
        .snapshots();
    return snapshot;
  }

  static Future<void> deleteDataFromFirestore() async {
    var collectionRef = getCollection();
    var snapshots = await collectionRef.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
