import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io'; // Add this import

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Login
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      // Check network connectivity
      print("Checking network connectivity...");
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isEmpty || result[0].rawAddress.isEmpty) {
          print("No internet connection detected");
          throw Exception("Please check your internet connection");
        }
      } on SocketException catch (_) {
        print("Socket exception - no internet");
        throw Exception(
          "network-request-failed: No internet connection available",
        );
      }

      // Attempt Firebase authentication
      print("Attempting to sign in with email: $email");
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in successfully with ID: ${userCredential.user?.uid}");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.code} - ${e.message}");
      throw Exception(e.code);
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception(e.toString());
    }
  }

  //signup with improved error handling
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      // Check network connectivity
      print("Checking network connectivity...");
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isEmpty || result[0].rawAddress.isEmpty) {
          print("No internet connection detected");
          throw Exception("Please check your internet connection");
        }
      } on SocketException catch (_) {
        print("Socket exception - no internet");
        throw Exception(
          "network-request-failed: No internet connection available",
        );
      }

      // Attempt Firebase authentication
      print("Attempting to create user with email: $email");
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      print("User created successfully with ID: ${userCredential.user?.uid}");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.code} - ${e.message}");
      throw Exception(e.code);
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
