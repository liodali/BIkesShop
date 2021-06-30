import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FilterFramePriceRange extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final stateController = useState(GroupController(
      isMultipleSelection: false,
    ));
    final stateValueRange = useState(RangeValues(400, 600));
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Text(
                    "Frame Size",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                SimpleGroupedCheckbox<String>(
                  controller: stateController.value,
                  itemsTitle: [
                    "16-17 inch",
                    "17-18 inch",
                    "18-19 inch",
                  ],
                  values: [
                    "16,17",
                    "17,18",
                    "18,19",
                  ],
                  checkFirstElement: false,
                  onItemSelected: (frame) {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  child: Text(
                    "Price range",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  height: 72,
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      SliderTheme(
                        data: SliderThemeData(
                          activeTickMarkColor: Colors.amberAccent,
                          valueIndicatorColor: Colors.black54,
                          valueIndicatorTextStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          showValueIndicator: ShowValueIndicator.always,
                        ),
                        child: RangeSlider(
                          activeColor: Theme.of(context).primaryColorDark,
                          inactiveColor: Colors.grey[400],
                          labels: RangeLabels(
                            "${stateValueRange.value.start.toInt()}",
                            "${stateValueRange.value.end.toInt()}",
                          ),
                          min: 200,
                          max: 950,
                          values: stateValueRange.value,
                          onChanged: (values) {
                            stateValueRange.value = values;
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Text("200"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Text("900"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                MaterialLocalizations.of(context).closeButtonLabel,
              ),
            ),
          ],
        )
      ],
    );
  }
}
