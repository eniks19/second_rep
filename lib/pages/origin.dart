import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gym/data/workout_data.dart';
import 'package:gym/pages/new.dart';
import 'package:provider/provider.dart';

class OriginalPage extends StatefulWidget {
  const OriginalPage({super.key});

  @override
  State<OriginalPage> createState() => _OriginalPageState();
}

class _OriginalPageState extends State<OriginalPage> {
  final newController = TextEditingController();

  void createNewWorkout() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Create new workout'),
              content: TextField(
                controller: newController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              actions: [
                MaterialButton(
                  onPressed: save,
                  child: Text('Save'),
                ),
                MaterialButton(
                  onPressed: cancel,
                  child: Text('Cancel'),
                )
              ],
            ));
  }

  void save() {
    String newWorkoutName = newController.text;
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);

    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newController.clear();
  }

  void goToWorkoutPage(String workoutName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewPage(workoutName: workoutName)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Workout Tracker',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: Icon(Icons.add),
        ),
        body: SafeArea(
            child: ListView.builder(
                itemCount: value.getWorkoutList().length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.getWorkoutList()[index].name),
                    trailing: IconButton(
                        onPressed: () =>
                            goToWorkoutPage(value.getWorkoutList()[index].name),
                        icon: Icon(Icons.arrow_forward_ios)),
                  );
                })),
      ),
    );
  }
}
