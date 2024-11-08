import 'package:flutter/material.dart';
import 'package:scrolling_parallax/lacation_data.dart';
import 'package:scrolling_parallax/widgets/location_list_item.dart';

class ParallaxRecipe extends StatelessWidget {
  const ParallaxRecipe({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final location in locations)
            LocationListItem(
                name: location.name,
                country: location.place,
                imageUrl: location.imageUrl),
        ],
      ),
    );
  }
}
