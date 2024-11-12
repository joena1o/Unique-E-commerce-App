import 'package:beunique_ecommerce/core/config/get_it_setup.dart';
import 'package:beunique_ecommerce/features/home_screen/data/model/user_model.dart';
import 'package:beunique_ecommerce/features/home_screen/data/repository/auth_repository.dart';
import 'package:beunique_ecommerce/helper/exception_handler.dart';
import 'package:beunique_ecommerce/utils/dialog_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  bool isSigningUser = false;
  final AuthRepository authRepository;

  AccountProvider({required this.authRepository});

  User? signedUser;
  UserModel? userData;

  void signUpUser(
      String email, String password, String firstName, String lastName) async {
    isSigningUser = true;
    notifyListeners();
    try {
      signedUser = await authRepository.signUpWithEmailPassword(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);
    } catch (e) {
      final message = handleExceptionWithMessage(e);
      getIt<DialogServices>().showMessageError(message);
    } finally {
      isSigningUser = false;
    }
    notifyListeners();
  }

  void userSignIn(String email, String password) async {
    isSigningUser = true;
    notifyListeners();
    try {
      signedUser = await authRepository.signInWithEmailPassword(
        email: email,
        password: password,
      );
      userData = await authRepository.getUserProfile(signedUser!.uid);
    } catch (e) {
      final message = handleExceptionWithMessage(e);
      getIt<DialogServices>().showMessageError(message);
    } finally {
      isSigningUser = false;
    }
    notifyListeners();
  }
}
