import 'package:caliskill/models/exercise.dart';
import 'package:caliskill/models/program.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static List<Exercise> get exercises => [
        Exercise(
          id: 1,
          name: 'Back lever',
          image: 'back_lever.png',
        ),
        Exercise(
          id: 2,
          name: 'Front lever',
          image: 'front_lever.png',
        ),
        Exercise(
          id: 3,
          name: 'Handstand',
          image: 'handstand.png',
        ),
        Exercise(
          id: 4,
          name: 'Handstand Push Up',
          image: 'handstand_push_up.png',
        ),
        Exercise(
          id: 5,
          name: 'Human flag',
          image: 'human_flag.png',
        ),
        Exercise(
          id: 6,
          name: 'Muscle Up',
          image: 'muscle_up.png',
        ),
        Exercise(
          id: 7,
          name: 'One arm front lever',
          image: 'one_arm_front_lever.png',
        ),
        Exercise(
          id: 8,
          name: 'Pistol squat',
          image: 'pistol_squat.png',
        ),
        Exercise(
          id: 9,
          name: 'Planck',
          image: 'planck.png',
        ),
        Exercise(
          id: 8,
          name: 'V-sit',
          image: 'v_sit.png',
        ),
      ];

  static List<Program> get levelOnePrograms => [
        Program(
          id: 1,
          name: 'Back lever',
          days: 23,
          image: 'back_lever.png',
        ),
        Program(
          id: 2,
          name: 'Front lever',
          days: 23,
          image: 'front_lever.png',
        ),
        Program(
          id: 3,
          name: 'Handstand',
          days: 23,
          image: 'handstand.png',
        ),
      ];

  static List<Program> get levelTwoPrograms => [
        Program(
          id: 4,
          name: 'Handstand push up',
          days: 23,
          image: 'handstand_push_up.png',
        ),
        Program(
          id: 5,
          name: 'Human flag',
          days: 23,
          image: 'human_flag.png',
        ),
        Program(
          id: 6,
          name: 'Muscle uo',
          days: 23,
          image: 'muscle_up.png',
        ),
      ];

  static List<Program> get levelThreePrograms => [
        Program(
          id: 7,
          name: 'One arm front lever',
          days: 23,
          image: 'one_arm_front_lever.png',
        ),
        Program(
          id: 8,
          name: 'Pistol squat',
          days: 23,
          image: 'pistol_squat.png',
        ),
        Program(
          id: 9,
          name: 'Planck',
          days: 23,
          image: 'planck.png',
        ),
      ];

  static List<Program> get masterLevelPrograms => [
        Program(
          id: 10,
          name: 'V-Sit',
          days: 23,
          image: 'v_sit.png',
        ),
        Program(
          id: 11,
          name: 'Handstand',
          days: 23,
          image: 'handstand.png',
        ),
        Program(
          id: 12,
          name: 'Back Lever',
          days: 23,
          image: 'back_lever.png',
        ),
      ];
}
