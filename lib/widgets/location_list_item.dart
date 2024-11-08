import 'package:flutter/material.dart';
import 'package:scrolling_parallax/widgets/flow_delegate.dart';


class LocationListItem extends StatelessWidget {
  LocationListItem(
      {required this.name,
      required this.country,
      required this.imageUrl,
      super.key});
  final String name;
  final String country;
  final String imageUrl;
  final GlobalKey imageKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            backgroundParallax(context),
            myGradient(),
            myText(),
          ],
        ),
      ),
    );
  }

  Positioned myText() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Positioned myGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Positioned backgroundParallax(BuildContext context) {
    return Positioned.fill(
      child: Flow(
        delegate: MyFlowDelegate(
            scrollableState: Scrollable.of(context),
            listItemContext: context,
            imageKey: imageKey),
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            key: imageKey,
          ),
        ],
      ),
    );
  }
}
