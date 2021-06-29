import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTabFilter extends HookWidget {
  final List<String> tabs;
  final Function(String) selectedCategory;

  CustomTabFilter({
    Key? key,
    required this.tabs,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabsSelected = useState(tabs.first);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs
            .map(
              (category) => GestureDetector(
                onTap: () {
                  tabsSelected.value = category;
                  selectedCategory(category);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 3.0,
                    horizontal: 8.0,
                  ),
                  child: Tab(
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: category == tabsSelected.value ? 16 : 14,
                        color: category == tabsSelected.value
                            ? Colors.black
                            : Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
