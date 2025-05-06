import 'dart:developer';
import 'package:shamz_ai/app_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthenticationProvider {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Stream<UserModel> retrieveCurrentUser() {
    return auth.authStateChanges().map((User? user) {
      if (user != null) {
        return UserModel(uid: user.uid, email: user.email!);
      } else {
        log("user not get retrive ");
        return UserModel(uid: "uid", email: '');
      }
    });
  }

  Future<UserModel> getCurrentUserDetails() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await _firestore.collection('users').doc(user.uid).get();
      return UserModel.fromFirestore(userDoc.data() as Map<String, dynamic>); // Adjust here
    } else {
      throw Exception("No user signed in");
    }
  }

  Future<UserCredential?> signUp(UserModel user) async {
    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );
      await _firestore.collection('users').doc(authResult.user!.uid).set(user.copyWith(uid: authResult.user!.uid).toFirestore());
      return authResult;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message.toString());
    }
  }

  Future<UserCredential?> signIn(UserModel user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password!);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message.toString());
    }
  }

  Future<void> verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      return await user.sendEmailVerification();
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<String> uploadImageAndGetUrl(File imageFile) async {
    try {
      String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
      String imagePath = 'images/$currentUserId/user_image';

      Reference ref = storage.ref(imagePath);
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<UserModel> updateUserProfile(UserModel user) async {
    try {
      User? currentUser = auth.currentUser;
      if (currentUser != null) {
        await _firestore.collection('users').doc(currentUser.uid).update(user.toFirestore());
        return await getCurrentUserDetails();
      } else {
        throw Exception("No user signed in");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> updateUserProfileImage(String imageUrl) async {
    try {
      User? currentUser = auth.currentUser;
      if (currentUser != null) {
        await _firestore.collection('users').doc(currentUser.uid).update({'imageUrl': imageUrl});
        return await getCurrentUserDetails();
      } else {
        throw Exception("No user signed in");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}