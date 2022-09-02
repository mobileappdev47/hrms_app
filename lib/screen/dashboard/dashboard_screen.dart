import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:hrms_app/screen/dashboard/bloc/dashboard_bloc_event.dart';
import 'package:hrms_app/screen/dashboard/bloc/dashboard_bloc_state.dart';
import 'package:hrms_app/screen/dashboard/widgets/bottomNavigationBar.dart';
import 'package:hrms_app/screen/home_screen/home_screen.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/pms_status_screen.dart';
import 'package:hrms_app/screen/profile_screen/profile_screen.dart';
import 'package:hrms_app/utils/color_res.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    context.read<DashboardBloc>().add(OnInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.backgroundColor,
        body: BlocBuilder<DashboardBloc, DashBoardState>(
          builder: (context, state) {
            print(state.loginToken);
            if (state.pageIndex == 0) {
              return const HomeScreen();
            } else if (state.pageIndex == 1) {
              return const PmsStatusScreen();
            } else if (state.pageIndex == 2) {
              return const ProfileScreen();
            } else {
              return const ProfileScreen();
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<DashboardBloc, DashBoardState>(
          builder: (context, state) => bottomNavigationBar(
            context,
            (int value) =>
                context.read<DashboardBloc>().add(ChangeTab(value, context)),
            state.pageIndex,
            //controller.onTapFlatButton,
          ),
        ));
  }
}
