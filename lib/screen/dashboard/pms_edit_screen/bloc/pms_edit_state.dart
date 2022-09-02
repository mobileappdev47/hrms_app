class PMSEditState {
  List text = ["Shared Goals", "Finance", "Customer", "Process", "Best People"];
  List? selected;
  bool isShow;
  String? selectedText;

  PMSEditState({this.isShow = false, this.selected, this.selectedText}) {
    selected ??= [];
    selectedText ??= "";
  }

  PMSEditState copyWith({bool? show, String? text, List? list}) {
    return PMSEditState(
        isShow: show ?? isShow,
        selectedText: text ?? selectedText,
        selected: list ?? selected);
  }
}
