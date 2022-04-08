import 'package:caliskill/models/exercise.dart';
import 'package:caliskill/models/program.dart';
import 'package:caliskill/models/workout.dart';
import 'package:caliskill/models/workout_type.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  late Program _program;
  late int _selectedDay;
  late int _lastCompletedDay;

  @override
  void onInit() {
    super.onInit();
    _lastCompletedDay = 10;
    _selectedDay = _lastCompletedDay + 1;
  }

  static Program get customProgram => Program(
        id: -1,
        days: 30,
        name: 'Custom Program',
        image: 'front_lever.png',
      );

  // Used to workouts. If type == null, return all workouts
  List<Workout> workouts({WorkoutType? type}) {
    List<Workout> _workouts = [];
    if (type == WorkoutType.warmUp) {
      //  Return Warm Up workouts
      _workouts = List.generate(
        3,
        (index) => Workout(
          id: index,
          reps: 23,
          day: selectedDay,
          type: WorkoutType.warmUp,
          exercise: Exercise(
            id: index,
            name: 'Front lever',
            image: 'front_lever.png',
          ),
          program: program,
        ),
      );
    } else if (type == WorkoutType.workout) {
      // Return workouts
      _workouts = List.generate(
        17,
        (index) => Workout(
          id: index,
          day: selectedDay,
          reps: 4 * index,
          type: WorkoutType.workout,
          exercise: Exercise(
            id: index,
            name: 'Front lever',
            image: 'front_lever.png',
          ),
          program: program,
        ),
      );
    } else if (type == WorkoutType.stretch) {
      //  Return Stretch workouts
      _workouts = List.generate(
        3,
        (index) => Workout(
          id: index,
          day: selectedDay,
          reps: 2 * index,
          time: 180,
          type: WorkoutType.stretch,
          exercise: Exercise(
            id: index,
            name: 'Front lever',
            image: 'front_lever.png',
          ),
          program: program,
        ),
      );
    } else {
      // Return all workouts without filter
      _workouts = List.generate(
        _program.days ?? 0,
        (index) => Workout(
          id: index,
          day: index,
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

    return _workouts.where((workout) => workout.day == selectedDay).toList();
  }

  int get workoutLength => workouts().length;

  set program(Program program) {
    _program = program;
    _lastCompletedDay = 10;
    _selectedDay = _lastCompletedDay + 1 < (_program.days ?? 0)
        ? _lastCompletedDay + 1
        : (_program.days != null ? _program.days! - 1 : 0);
    update();
  }

  Program get program => _program;

  int get selectedDay => _selectedDay;

  set selectedDay(int day) {
    _selectedDay = day;
    update();
  }

  int get lastCompletedDay => _lastCompletedDay;

  set lastCompletedDay(int day) {
    _lastCompletedDay = day;
    update();
  }
}
