abstract class WelcomeEvent {}

class SliderChange extends WelcomeEvent {
  final int? index;

  SliderChange({this.index});
}

class NextPage extends WelcomeEvent {}
class NavigatePage extends WelcomeEvent{}
class OnStart extends WelcomeEvent{}