import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/main_bottom_menu_sceleton.dart';
import '../views/login_page.dart';

class EmailAuthController extends GetxController {
  //AuthController.instance
  static EmailAuthController instance = Get.find<EmailAuthController>();

  //email, password, name ...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //для прослушивания
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => LoginView());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      //сюда можно передвать данные пользователя из базы
      Get.offAll(() => MyBottomMenuSceleton(email: user.email ?? 'no email'));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {
      Get.snackbar(
        "Register error $firebaseAuthException",
        firebaseAuthException.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(firebaseAuthException.toString());
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {
      Get.snackbar(
        "Login error $firebaseAuthException",
        firebaseAuthException.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(firebaseAuthException.toString());
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
