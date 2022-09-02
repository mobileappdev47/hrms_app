import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:hrms_app/screen/dashboard/pms_edit_screen/bloc/pms_edit_bloc.dart';
import 'package:hrms_app/screen/login_screen/bloc/login_bloc.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/bloc/pms_status_bloc.dart';
import 'package:hrms_app/screen/welcome_screen/bloc/welcome_bloc.dart';
import 'package:hrms_app/screen/welcome_screen/welcome_screen.dart';
import 'package:hrms_app/screen/welcome_screen/bloc/welcome_state.dart';
import 'package:hrms_app/utils/helper.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WelcomeBloc>(create: (context) => WelcomeBloc()),
          BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
          BlocProvider<DashboardBloc>(create: (context) => DashboardBloc()),
          BlocProvider<PMSStatusBloc>(create: (context) => PMSStatusBloc()),
          BlocProvider<PMSEditBloc>(create: (context) => PMSEditBloc()),
        ],
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              home: const WelcomeScreen(),
            );
          },
        ));
    /* return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: [
          GetPage(
              name: AppRes.welcomeScreen,
              page: () => const WelcomeScreen(),
              binding: BindingsBuilder(() => WelcomeScreenController())),
          GetPage(
              name: AppRes.loginScreen,
              page: () => const LoginScreen(),
              binding: BindingsBuilder(() => LoginScreenController())),
          GetPage(
              name: AppRes.homeScreen,
              page: () => const HomeScreen(),
              binding: BindingsBuilder(() => HomeScreenController())),
          GetPage(
              name: AppRes.profileScreen,
              page: () => const ProfileScreen(),
              ),
          GetPage(
              name: AppRes.dashBoardScreen,
              page: () => const DashBoardScreen(),),
          GetPage(
              name: AppRes.pmsEditScreen,
              page: () => const PmsEditScreen(),
              binding: BindingsBuilder(() => PmsEditScreenController())),
          GetPage(
              name: AppRes.pmsStatusScreen,
              page: () => const PmsStatusScreen(),
              binding: BindingsBuilder(() => PmsStatusController()))
        ],
        home: const WelcomeScreen());*/
  }
}
