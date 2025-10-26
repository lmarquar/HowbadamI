import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Future<Activity> futureActivity;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    futureActivity = fetchActivity();
  }

  void _refreshActivity() {
    setState(() {
      futureActivity = fetchActivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Activity'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFirst = !isFirst;
              });
            },
            icon: Icon(Icons.switch_access_shortcut),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Activity>(
          future: futureActivity,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshActivity,
                    child: const Text('Try Again'),
                  ),
                ],
              );
            } else if (snapshot.hasData) {
              final activity = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AnimatedCrossFade(
                      firstChild: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity.activity,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          _buildInfoRow(Icons.category, 'Type', activity.type),
                          _buildInfoRow(
                            Icons.group,
                            'Participants',
                            '${activity.participants}',
                          ),
                          _buildInfoRow(
                            Icons.attach_money,
                            'Price',
                            _getPriceLevel(activity.price),
                          ),
                          _buildInfoRow(
                            Icons.accessible,
                            'Accessibility',
                            activity.accessibility,
                          ),
                          _buildInfoRow(
                            Icons.schedule,
                            'Duration',
                            activity.duration,
                          ),
                          _buildInfoRow(
                            Icons.child_care,
                            'Kid Friendly',
                            activity.kidFriendly ? 'Yes' : 'No',
                          ),
                          if (activity.link.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () {
                                // You can add url_launcher package to open the link
                                // launch(activity.link);
                              },
                              icon: const Icon(Icons.link),
                              label: const Text('Learn More'),
                            ),
                          ],
                        ],
                      ),
                      secondChild: Center(
                        child: Image.asset('assets/images/LeLogo.png'),
                      ),
                      crossFadeState: isFirst
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 1000),
                    ),
                  ),
                ),
              );
            } else {
              return const Text('No data available');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshActivity,
        tooltip: 'Get New Activity',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  String _getPriceLevel(double price) {
    if (price == 0) return 'Free';
    if (price < 0.3) return 'Low';
    if (price < 0.6) return 'Medium';
    return 'High';
  }
}

class Activity {
  final String activity;
  final double availability;
  final String type;
  final int participants;
  final double price;
  final String accessibility;
  final String duration;
  final bool kidFriendly;
  final String link;
  final String key;

  const Activity({
    required this.activity,
    required this.availability,
    required this.type,
    required this.participants,
    required this.price,
    required this.accessibility,
    required this.duration,
    required this.kidFriendly,
    required this.link,
    required this.key,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'activity': String activity,
        'availability': num availability,
        'type': String type,
        'participants': int participants,
        'price': num price,
        'accessibility': String accessibility,
        'duration': String duration,
        'kidFriendly': bool kidFriendly,
        'link': String link,
        'key': String key,
      } =>
        Activity(
          activity: activity,
          availability: availability.toDouble(),
          type: type,
          participants: participants,
          price: price.toDouble(),
          accessibility: accessibility,
          duration: duration,
          kidFriendly: kidFriendly,
          link: link,
          key: key,
        ),
      _ => throw const FormatException('Failed to load activity.'),
    };
  }
}

// Fetch activity from API
Future<Activity> fetchActivity() async {
  final response = await http.get(
    Uri.parse(
      'https://bored-api.appbrewery.com/random',
    ), // Replace with your actual API endpoint
  );

  if (response.statusCode == 200) {
    return Activity.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load activity');
  }
}
