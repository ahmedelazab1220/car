import 'package:car_help/app.dart';
import 'package:car_help/config/environment/env_helper.dart';
import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/config/helper/locale_helper/locale_cubit/bloc_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await dotenv.load(fileName: Environment.fileName);
  serviceLocator();
  runApp(const MyApp());
}
