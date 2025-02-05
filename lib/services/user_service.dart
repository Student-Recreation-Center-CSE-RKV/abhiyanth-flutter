import 'package:abhiyanth/locator.dart';
import 'package:abhiyanth/models/user_model.dart';
import 'package:abhiyanth/services/db_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class UserService {
  static User? currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? get getUser => _auth.currentUser;

  // Future<User?> signInWithGoogle() async {
  //   try {
  //
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) {
  //       return null;
  //     }
  //
  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     final UserCredential userCredential = await _auth.signInWithCredential(credential);
  //
  //     String FCM_Token=await notificationServices.getToken();
  //     final FCM_TokenCollection = await DBService.FCM_Tokens.doc("Tokens");
  //     final String token = await notificationServices.getToken();
  //     FCM_TokenCollection.update({
  //       "Token": FieldValue.arrayUnion([token])
  //     });
  //     await userService.createNewUser(
  //       UserModel(
  //           uid: userCredential.user!.uid,
  //           name: userCredential.user!.displayName,
  //           email:userCredential.user!.email,
  //           mobile:"",
  //           branch: "",
  //           batch: "",
  //           id: "",
  //           role: "student",
  //           createdAt:DateTime.now(),
  //         FCM_Token:FCM_Token,
  //       ),
  //     );
  //     return userCredential.user;
  //   } catch (e) {
  //     print('Error during Google sign-in: $e');
  //     return null;
  //   }
  // }
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        return null;
      }

      // Get FCM Token
      String FCM_Token = await notificationServices.getToken();
      final FCM_TokenCollection = await DBService.FCM_Tokens.doc("Tokens");

      final DocumentReference userDocRef = DBService.users.doc(firebaseUser.uid);
      final DocumentSnapshot userDoc = await userDocRef.get();

      if (userDoc.exists) {
            FCM_TokenCollection.update({
              "Token": FieldValue.arrayUnion([FCM_Token])
            });
        await userDocRef.update({
          "FCM_Token": FCM_Token
        });
      } else {
        await userService.createNewUser(
          UserModel(
            uid: firebaseUser.uid,
            name: firebaseUser.displayName ?? "",
            email: firebaseUser.email ?? "",
            mobile: "",
            branch: "",
            batch: "",
            id: "",
            role: "student",
            createdAt: DateTime.now(),
            FCM_Token: FCM_Token,
          ),
        );
      }


      return firebaseUser;
    } catch (e) {
      print('Error during Google sign-in: $e');
      return null;
    }
  }

  Future<User?> signupWithEmailAndPassword(String email, String password) async {
    try {

      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userService.createNewUser(
        UserModel(
            uid: userCredential.user!.uid,
            name: userCredential.user!.displayName,
            email:userCredential.user!.email,
            mobile:"",
            branch: "",
            batch: "",
            id: "",
            role: "student",
            createdAt:DateTime.now()
        ),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      print(e);
      throw Exception("Signup failed. Please try again.");
    }
  }
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e; // Let the caller handle specific FirebaseAuth exceptions
    } catch (e) {
      throw Exception("Signup failed. Please try again.");
    }
  }

  // Function to handle user sign out
  Future<void> signOut() async {
    String userId = _auth.currentUser!.uid;

    final userDoc = await DBService.users.doc(userId).get();

    if (userDoc.exists) {
      final userData = userDoc.data() as Map<String, dynamic>;
      final String? token = userData['FCM_Token'];

      if (token != null) {
        final FCM_Token = DBService.FCM_Tokens.doc("Tokens");
        await FCM_Token.update({
          "Token": FieldValue.arrayRemove([token]),
        });
      }
      await DBService.users.doc(userId).update({
        'FCM_Token': "",
      });

      await _googleSignIn.signOut();
      await _auth.signOut();
    }
  }

  Future<void> createNewUser(UserModel user) async {
    await DBService.users.doc(user.uid).set(user.toJson());
    return;
  }
}
