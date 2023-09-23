import 'package:flutter/material.dart';

enum Priority { urgent, normal, low}

class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem(this.text, this.priority, {super.key});

final String text;
final Priority priority;

@override
State<CheckableTodoItem> createState() => _CheckableTodoItemState();
}

class _CheckableTodoItemState extends State<CheckableTodoItem> {
var _done = false;

void _setDone(bool? isChecked) {
  setState(() {
    _done = isChecked ?? false;
  });
}
@override
Widget build(BuildContext context) {
  var icon = Icons.low_priority;

  if (widget.priority == Priority.urgent) {
    icon = Icons.notifications_active;
  }

  if (widget.priority == Priority.normal) {
    icon = Icons.list;
  }
  return Padding(
    padding: EdgeInsets.all(8.0), // Add padding as needed
    child: Row(
      children: [
        Checkbox(
          value: _done,
          onChanged: _setDone,
        ),
        Icon(icon), // Display the priority icon
        SizedBox(width: 8.0), // Add some spacing between the icon and text
        Text(widget.text), // Display the todo text
      ],
    ),
  );
}
}
