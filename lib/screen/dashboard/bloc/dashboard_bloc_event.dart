import 'package:flutter/material.dart';

abstract class DashboardEvent {}

class ChangeTab extends DashboardEvent {
  final int index;
  final BuildContext context;


  ChangeTab(this.index,this.context);

}
class OnInit extends DashboardEvent{

}