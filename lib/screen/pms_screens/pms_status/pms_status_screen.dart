import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/bloc/pms_status_bloc.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/bloc/pms_status_event.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/bloc/pms_status_state.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/widgets/pms_status_tile.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/widgets/widgets.dart';
import 'package:hrms_app/utils/color_res.dart';
import 'package:hrms_app/utils/string_res.dart';

class PmsStatusScreen extends StatefulWidget {
  const PmsStatusScreen({Key? key}) : super(key: key);

  @override
  State<PmsStatusScreen> createState() => _PmsStatusScreenState();
}

class _PmsStatusScreenState extends State<PmsStatusScreen> {
  @override
  void initState() {
    context.read<PMSStatusBloc>().add(GetAssignData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: BlocBuilder<PMSStatusBloc, PMSStatusState>(
        builder: (context, state) => state.isLoading == true
            ? SizedBox(
                height: height,
                width: width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  appBar(context),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 17, right: 10, left: 10),
                    decoration: const BoxDecoration(
                      color: ColorRes.white2, /*border: Border.all()*/
                    ),
                    child: Row(
                      children: [
                        pmsBox(
                            topColor: ColorRes.redColor,
                            title: Strings.overdue,
                            text: 10),
                        pmsBox(
                            topColor: ColorRes.orangeColor,
                            title: Strings.notStarted,
                            text: 15),
                        pmsBox(
                            topColor: ColorRes.lightYellow,
                            title: Strings.inProgress,
                            text: 4),
                        pmsBox(
                            topColor: ColorRes.lightGreen,
                            title: Strings.completed,
                            text: 5),
                      ],
                    ),
                  ),
                  ListView.builder(
                      itemCount: state.assignedKpiFormsModel!.data == null
                          ? 0
                          : state.assignedKpiFormsModel!.data!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              context
                                  .read<PMSStatusBloc>()
                                  .add(NavigateNextPage());
                            },
                            child: pmsStatusTile(
                                name: state.assignedKpiFormsModel!.data![index].assignedKpiFormReviewDetails!.assigneeName,
                                total: state.total[index],
                                completed: state.completed[index],
                                inProgress: state.inProgress[index],
                                overdue: state.overdue[index],
                                empNum: state.assignedKpiFormsModel!
                                    .data![index].assignedKpiFormReviewDetails!.assigneeEmpNo,
                                context: context));
                      })
                ],
              ),
      ),
    );
  }
}
