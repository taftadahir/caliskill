import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Remove splash screen after initialization is completed
    FlutterNativeSplash.remove();

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calisthenics Skill Application',
      home: Scaffold(
        body: Center(
          child: Text('Hello'),
        ),
      ),
    );
  }
}
