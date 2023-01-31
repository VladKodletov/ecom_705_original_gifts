import 'package:ecom_705_original_gifts/features/authent/presentation/authent_screen.dart';
import 'package:ecom_705_original_gifts/features/mainscreen/presentation/widgets/bottom_nav_bar.dart';
import 'package:ecom_705_original_gifts/features/registration/presentation/reg_authent_screen.dart';
import 'package:ecom_705_original_gifts/features/restore_password/presentation/restore_password_screen.dart';

final routes = {
  '/': (context) => const ScreenAuth(),
  '/reg_screen': (context) => const RegScreenAuth(),
  '/restore_password': (context) => const ResetPassword(),
  '/mainscreen': (context) => const BottomNavBar(),
};
