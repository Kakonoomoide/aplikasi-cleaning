import 'package:final_project_2023/app/modules/login/views/login_view.dart';
import 'package:final_project_2023/app/routes/app_pages.dart';
import 'package:firedart/firedart.dart';
import 'package:get/get.dart';
import 'package:firedart/auth/firebase_auth.dart';

class RegisterController extends GetxController {
  void register(String email, String password) async {
    try {
      await FirebaseAuth.instance.signUp(email, password);
      Get.showSnackbar(GetSnackBar(
        title: "Register Success",
        message: "Silahkan Login",
        duration: Duration(seconds: 2),
      ));
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      if (e.toString() == 'AuthException: INVALID_EMAIL') {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Register Error',
            message: 'Format email salah',
            duration: Duration(seconds: 3),
          ),
        );
      } else if (e.toString() == 'AuthException: INVALID_PASSWORD') {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Register Error',
            message: 'Password salah',
            duration: Duration(seconds: 3),
          ),
        );
      } else if (e.toString() == 'AuthException: EMAIL_NOT_FOUND') {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'register Error',
            message: 'User tidak terdaftar',
            duration: Duration(seconds: 3),
          ),
        );
      }
      print(e.toString());
    }
  }
   void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginView());
  }
}
