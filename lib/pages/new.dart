import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gym/component/exercise_tile.dart';
import 'package:gym/data/workout_data.dart';
import 'package:provider/provider.dart';

class NewPage extends StatefulWidget {
  NewPage({super.key, required this.workoutName});
  dynamic workoutName;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  void onCheckBoxChanged(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercise(workoutName, exerciseName);
  }

  final exerciseNameController = TextEditingController();
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsController = TextEditingController();

  void createNewExercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add a new exercise',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: exerciseNameController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: weightController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: repsController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: setsController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void save() {
    String newExerciseName = exerciseNameController.text;
    String weight = weightController.text;
    String reps = repsController.text;
    String sets = setsController.text;
    Provider.of<WorkoutData>(context, listen: false)
        .addExercise(widget.workoutName, newExerciseName, weight, reps, sets);

    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    exerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.workoutName),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewExercise, //if the function is void no ()=>
          child: Icon(Icons.add),
        ),
        body: SafeArea(
            child: ListView.builder(
                itemCount: value.numberOfExercisesInWorkout(widget.workoutName),
                itemBuilder: (context, index) {
                  return ExerciseTile(
                    exerciseName: value
                        .getRelevantWorkout(widget.workoutName)
                        .exercise[index]
                        .name,
                    weight: value
                        .getRelevantWorkout(widget.workoutName)
                        .exercise[index]
                        .weight,
                    reps: value
                        .getRelevantWorkout(widget.workoutName)
                        .exercise[index]
                        .reps,
                    sets: value
                        .getRelevantWorkout(widget.workoutName)
                        .exercise[index]
                        .reps,
                    isCompleted: value
                        .getRelevantWorkout(widget.workoutName)
                        .exercise[index]
                        .isCompleted,
                    onCheckboxChanged: (val) => onCheckBoxChanged(
                      widget.workoutName,
                      value
                          .getRelevantWorkout(widget.workoutName)
                          .exercise[index]
                          .name,
                    ),
                  );
                })),
      ),
    );
  }
}
