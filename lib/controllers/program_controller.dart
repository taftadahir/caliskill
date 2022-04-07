import 'package:caliskill/models/exercise.dart';
import 'package:caliskill/models/program.dart';
import 'package:caliskill/models/workout.dart';
import 'package:caliskill/models/workout_type.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  late Program _program;
  late int _selectedDay;

  @override
  void onInit() {
    super.onInit();
    _selectedDay = 0;
  }

  static Program get customProgram => Program(
        id: -1,
        name: 'Custom Program',
        image: 'front_lever.png',
      );

  // Used to workouts. If type == null, return all workouts
  List<Workout> workouts({WorkoutType? type}) {
    List<Workout> _workouts = [];
    if (type == WorkoutType.warmUp) {
      //  Return Warm Up workouts
      _workouts = List.generate(
        4,
        (index) => Workout(
            id: index,
            reps: 23,
            type: WorkoutType.warmUp,
            exercise: Exercise(
              id: index,
              name: 'Front lever',
              image: 'front_lever.png',
            ),
            program: program),
      );
    } else if (type == WorkoutType.workout) {
      // Return workouts
      _workouts = List.generate(
        20,
        (index) => Workout(
            id: index,
            reps: 4 * index,
            type: WorkoutType.workout,
            exercise: Exercise(
              id: index,
              name: 'Front lever',
              image: 'front_lever.png',
            ),
            program: program),
      );
    } else if (type == WorkoutType.stretch) {
      //  Return Stretch workouts
      _workouts = List.generate(
        4,
        (index) => Workout(
            id: index,
            reps: 2 * index,
            time: 180,
            type: WorkoutType.stretch,
            exercise: Exercise(
              id: index,
              name: 'Front lever',
              image: 'front_lever.png',
            ),
            program: program),
      );
    } else {
      // Return all workouts without filter
      _workouts = List.generate(
        28,
        (index) => Workout(
          id: index,
          reps: 4 * index,
          type: index % 3 == 0
              ? WorkoutType.workout
              : (index % 2 == 0 ? WorkoutType.warmUp : WorkoutType.stretch),
          exercise: Exercise(
            id: index,
            name: 'Front lever',
            image: 'front_lever.png',
          ),
          program: program,
        ),
      );
    }

    return _workouts;
  }

  int get workoutLength => workouts().length;

  set program(Program program) {
    _program = program;
    update();
  }

  Program get program => _program;

  int get selectedDay => _selectedDay;

  set selectedDay(int day) {
    _selectedDay = day;
    update();
  }
}
