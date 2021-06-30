import 'package:bikes_shop/app/common/internationalisation.dart';
import 'package:bikes_shop/app/viewmodel/bikes_view_model.dart';
import 'package:bikes_shop/domain/models/filter.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class FilterFramePriceRange extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final bikeVM = Provider.of<BikesViewModel>(context, listen: false);
    final stateController = useState(GroupController(
      isMultipleSelection: false,
      initSelectedItem: (bikeVM
                  .filter.filters[FilterBikes.frameSizeLabel]!.value as String)
              .isNotEmpty
          ? [bikeVM.filter.filters[FilterBikes.frameSizeLabel]!.value as String]
          : [],
    ));
    final initValueRanges = getPriceRangeFromFilter(bikeVM);
    final stateValueRange = useState(RangeValues(
      initValueRanges.first.toDouble(),
      initValueRanges.last.toDouble(),
    ));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                    "19-21 inch",
                  ],
                  values: [
                    "16,17",
                    "17,18",
                    "18,19",
                    "19,21",
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
                        child: Text("950"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                stateValueRange.value = RangeValues(200, 950);
                stateController.value = GroupController(
                  isMultipleSelection: false,
                );
              },
              child: Text(
                BikeAppLocalizations.of(context)!.resetText,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            ElevatedButton(
              onPressed: () {
                final bikeVM =
                    Provider.of<BikesViewModel>(context, listen: false);
                String? selectedFrame =
                    stateController.value.selectedItem as String?;
                bikeVM
                    .saveFrameSize(selectedFrame != null ? selectedFrame : "");
                bikeVM.savePriceRange([
                  stateValueRange.value.start.toInt(),
                  stateValueRange.value.end.toInt(),
                ]);

                bikeVM.retrieveBikesByFilter();
                Navigator.pop(context);
              },
              child: Text(
                BikeAppLocalizations.of(context)!.applyText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<int> getPriceRangeFromFilter(BikesViewModel bikeVM) {
    return (bikeVM.filter.filters[FilterBikes.priceRangeLabel]!.value as String)
            .isNotEmpty
        ? (bikeVM.filter.filters[FilterBikes.priceRangeLabel]!.value as String)
            .split(",")
            .map((e) => int.parse(e))
            .toList()
        : [200, 950];
  }
}
