import 'package:animation/models/activity_model.dart';
import 'package:animation/widgets/fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class DetailsPage extends StatelessWidget {
  final ActivityModel activity;
  const DetailsPage({
    required this.activity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: "activity-img-${activity.imageUrl}",
            child: Image.asset(
              activity.imageUrl,
              height: 460,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(activity.name),
            subtitle: Text(
              '\$${activity.price} Only',
              style: const TextStyle(letterSpacing: 1),
            ),
            trailing: const Heart(),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              lorem(
                words: 60,
                paragraphs: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
