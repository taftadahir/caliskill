import 'package:caliskill/models/workout_type.dart';
import 'package:caliskill/models/exercise.dart';
import 'package:caliskill/models/program.dart';

class Workout {
  final int id;
  final Exercise exercise;
  final Program program;
  final int? reps;
  final int? time;
  final int? restTime;
  final WorkoutType type;
  final Workout? prev;

  Workout({
    required this.id,
    required this.exercise,
    required this.program,
    this.reps,
    this.time,
    this.restTime,
    this.type = WorkoutType.workout,
    this.prev,
  });
}
