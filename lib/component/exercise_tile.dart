import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ExerciseTile extends StatelessWidget {
  ExerciseTile(
      {super.key,
      required this.exerciseName,
      required this.weight,
      required this.reps,
      required this.sets,
      required this.isCompleted,
      required this.onCheckboxChanged});
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  void Function(bool?)? onCheckboxChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        title: Text(exerciseName),
        subtitle: Row(
          children: [
            Chip(label: Text('${weight}kg')),
            Chip(label: Text('${reps}reps')),
            Chip(label: Text('${sets}sets')),
          ],
        ),
        trailing: Checkbox(
            value: isCompleted,
            onChanged: (value) => onCheckboxChanged!(value)),
      ),
    );
  }
}
