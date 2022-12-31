import 'package:flutter/material.dart';
import 'package:movie_app/utilities/constants.dart';

class CategoryPage extends StatefulWidget {
  static String id = 'categoryPage';
  final List<String> categories;
  final double spacesBetweenChips;
  final Function(String value, int index) onChanged;
  const CategoryPage(
      {super.key,
      required this.categories,
      required this.onChanged,
      this.spacesBetweenChips = 58});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int indexSeleced = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.categories.length,
          itemExtent: widget.spacesBetweenChips,
          itemBuilder: ((context, index) {
            return Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSeleced = index;
                    });
                    widget.onChanged(
                        widget.categories[indexSeleced], indexSeleced);
                  },
                  child: Chip(
                    backgroundColor: indexSeleced == index
                        ? Constants.primaryColor
                        : Colors.white,
                    side: indexSeleced != index
                        ? const BorderSide(color: Constants.primaryColor)
                        : null,
                    label: Text(
                      widget.categories[index],
                      style: TextStyle(
                          color: indexSeleced == index
                              ? Colors.white
                              : Constants.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 8,
              // ),
            ]);
          })),
    );
  }
}

/**
 * Container(
      child: Row(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              indexSeleced = 0;
            });
          },
          child: Chip(
            backgroundColor:
                indexSeleced == 0 ? Constants.primaryColor : Colors.white,
            side: indexSeleced != 0
                ? BorderSide(color: Constants.primaryColor)
                : null,
            label: Text(
              "Week",
              style: TextStyle(
                  color:
                      indexSeleced == 0 ? Colors.white : Constants.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              indexSeleced = 1;
            });
          },
          child: Chip(
            backgroundColor:
                indexSeleced == 1 ? Constants.primaryColor : Colors.white,
            side: indexSeleced != 1
                ? BorderSide(color: Constants.primaryColor)
                : null,
            label: Text(
              "Daily",
              style: TextStyle(
                  color:
                      indexSeleced == 1 ? Colors.white : Constants.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ]),
    );
 */
