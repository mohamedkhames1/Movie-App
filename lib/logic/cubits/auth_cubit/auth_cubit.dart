import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // --- Sign In with Google ---
  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      // 1. Trigger the Google authentication flow.
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the user cancelled the flow, do nothing.
      if (googleUser == null) {
        emit(AuthInitial());
        return;
      }

      // 2. Obtain the auth details from the request.
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // 3. Create a new credential for Firebase.
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Sign in to Firebase with the credential.
      await _firebaseAuth.signInWithCredential(credential);

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Google Sign-In Failed.'));
    } catch (e) {
      emit(const AuthFailure('An unexpected error occurred.'));
    }
  }

  // --- Sign Up with Email & Password ---
  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const AuthFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(const AuthFailure('An account already exists for that email.'));
      } else {
        emit(AuthFailure(e.message ?? 'An error occurred.'));
      }
    } catch (e) {
      emit(const AuthFailure('An unexpected error occurred.'));
    }
  }

  // --- Login with Email & Password ---
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        emit(const AuthFailure('Invalid email or password.'));
      } else {
        emit(AuthFailure(e.message ?? 'An error occurred.'));
      }
    } catch (e) {
      emit(const AuthFailure('An unexpected error occurred.'));
    }
  }
}