import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Social login provider instances
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  /// Signs in with Google and authenticates with Firebase.
  /// Returns UserCredential on success, null on failure or cancellation.
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Initiate Google sign-in
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        debugPrint('Google Sign-In: User cancelled');
        return null;
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Sign in to Firebase
      //return await _auth.signInWithCredential(credential);
      final userCredential = await _auth.signInWithCredential(credential);
      final idToken = await userCredential.user?.getIdToken(); // Firebase idToken
      debugPrint('Firebase idToken: $idToken');
      return userCredential;
    } catch (e, stackTrace) {
      debugPrint('Google Sign-In Error: $e\n$stackTrace');
      return null;
    }
  }

  /// Signs in with Facebook and authenticates with Firebase.
  /// Returns UserCredential on success, null on failure or cancellation.
  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Initiate Facebook sign-in
      final LoginResult result = await _facebookAuth.login(
        permissions: ['public_profile', 'email'],
      );

      if (result.status != LoginStatus.success) {
        debugPrint('Facebook Sign-In: ${result.status}, ${result.message}');
        return null;
      }

      // Get access token
      final AccessToken? accessToken = result.accessToken;
      if (accessToken == null) {
        debugPrint('Facebook Sign-In: No access token received');
        return null;
      }

      // Create Firebase credential
      final credential = FacebookAuthProvider.credential(accessToken.toString());

      // Sign in to Firebase
      return await _auth.signInWithCredential(credential);
    } catch (e, stackTrace) {
      debugPrint('Facebook Sign-In Error: $e\n$stackTrace');
      return null;
    }
  }

  /// Signs in with Apple and authenticates with Firebase.
  /// Returns UserCredential on success, null on failure or cancellation.
  Future<UserCredential?> signInWithApple() async {
    try {
      // Perform Apple sign-in
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create OAuth credential for Apple
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Sign in to Firebase
      final userCredential = await _auth.signInWithCredential(oauthCredential);

      // Update display name if provided (only available on first login)
      if (appleCredential.givenName != null && appleCredential.familyName != null) {
        final displayName = '${appleCredential.givenName} ${appleCredential.familyName}';
        await userCredential.user?.updateDisplayName(displayName);
      }

      return userCredential;
    } catch (e, stackTrace) {
      debugPrint('Apple Sign-In Error: $e\n$stackTrace');
      return null;
    }
  }

  /// Signs out from all providers and Firebase.
  Future<void> signOut() async {
    try {
      await Future.wait([
        _googleSignIn.signOut(),
        _facebookAuth.logOut(),
        _auth.signOut(),
      ]);
      debugPrint('Signed out from all providers');
    } catch (e, stackTrace) {
      debugPrint('Sign-Out Error: $e\n$stackTrace');
    }
  }

  /// Returns the current Firebase user, if any.
  User? get currentUser => _auth.currentUser;
}