import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  int _indexPage = 0;
  int _maxPages = 3;

  late final _pageController = PageController(
    initialPage: _indexPage,
    keepPage: true,
  );

  PageController get pageController => _pageController;

  int get indexPage => _indexPage;

  void goTo(int page) {
    assert(page < _maxPages);
    _indexPage = page;
    notifyListeners();
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 350),
      curve: Curves.linear,
    );
  }
}
