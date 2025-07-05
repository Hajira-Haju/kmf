import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(NotificationApp());

class NotificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NotificationTestPage());
  }
}

class NotificationTestPage extends StatefulWidget {
  @override
  _NotificationTestPageState createState() => _NotificationTestPageState();
}

class _NotificationTestPageState extends State<NotificationTestPage> {
  List<String> notifications = List.generate(
    10,
    (index) => 'Notification ${index + 1}',
  );

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LinkedIn-style Notifications")),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return Slidable(
            key: ValueKey(notification),
            endActionPane: ActionPane(
              motion: const ScrollMotion(), // Smooth drag motion
              extentRatio: 0.25, // How much to slide to reveal action
              children: [
                SlidableAction(
                  onPressed: (context) {
                    deleteNotification(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$notification deleted')),
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: ListTile(title: Text(notification)),
          );
        },
      ),
    );
  }
}
