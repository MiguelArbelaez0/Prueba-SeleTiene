import 'dart:async';

class NavViewModel {
  final StreamController<int> _pageIndexController = StreamController<int>();

  Stream<int> get pageIndexStream => _pageIndexController.stream;

  void setPageIndex(int index) {
    _pageIndexController.sink.add(index);
  }
}

final NavViewModel navViewModel = NavViewModel();
