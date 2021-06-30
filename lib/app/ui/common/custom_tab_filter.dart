import 'package:bikes_shop/app/viewmodel/bikes_view_model.dart';
import 'package:bikes_shop/domain/models/filter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

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
    final bikesViewModel = Provider.of<BikesViewModel>(context, listen: false);
    String category = bikesViewModel
        .filter.filters[FilterBikes.categoryLabel]!.value as String;
    final tabsSelected =
        useState(category != tabs.first ? category : tabs.first);

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
