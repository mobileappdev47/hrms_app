import 'package:hrms_app/screen/home_screen/home_screen.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/pms_status_screen.dart';
import 'package:hrms_app/screen/profile_screen/profile_screen.dart';

class DashBoardState {
  List pages = [
    const HomeScreen(),
    const PmsStatusScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];
  int? pageIndex;
  String loginToken;

  DashBoardState({this.pageIndex = 0, this.loginToken = ""});

  DashBoardState copyWith({int? currentTab, String? token}) {
    return DashBoardState(
        pageIndex: currentTab ?? pageIndex, loginToken: token ?? loginToken);
  }
}
