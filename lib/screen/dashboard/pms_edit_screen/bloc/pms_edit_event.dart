abstract class PMSEditEvent {}

  class IsShow extends PMSEditEvent {}

class AddRemoveText extends PMSEditEvent {
  final String? text;

  AddRemoveText({this.text});
}
class OnCallBack extends PMSEditEvent{}
