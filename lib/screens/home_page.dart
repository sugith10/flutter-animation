import 'package:animation/data/activity_data.dart';
import 'package:animation/models/activity_model.dart';
import 'package:animation/screens/details_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 1),
                builder: (context, val, _) {
                  return Opacity(
                    opacity: val,
                    child: Padding(
                      padding: EdgeInsets.only(top: val * 50),
                      child: Text(
                        "Pick Your\nFavorite Activity",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: activityList.length,
                itemBuilder: (context, index) {
                  return ActivityCardWidget(activity: activityList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCardWidget extends StatelessWidget {
  final ActivityModel activity;
  const ActivityCardWidget({
    required this.activity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(activity: activity),
            ),
          );
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Hero(
            //tag should be unique to each widget
            tag: "activity-img-${activity.imageUrl}",
            child: Image.asset(
              activity.imageUrl,
              height: 100,
            ),
          ),
        ),
        trailing: Text(activity.price.toString()),
        title: Text(activity.name),
        subtitle: Text(
          activity.location,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
