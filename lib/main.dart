import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xiag_test/api/http_api.dart';
import 'package:flutter_xiag_test/repository/repository.dart';
import 'package:flutter_xiag_test/res/dimens.dart';
import 'package:flutter_xiag_test/res/strings.dart';
import 'package:flutter_xiag_test/res/styles.dart';
import 'package:flutter_xiag_test/ui/main/main_screen.dart';
import 'package:flutter_xiag_test/ui/place/place_screen.dart';
import 'package:kiwi/kiwi.dart';

void main() {
  _initDI();
  runApp(const App());
}

void _initDI() {
  final kiwi = KiwiContainer()
    ..registerSingleton((container) => Repository())
    ..registerSingleton((container) => HttpApi());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(Dimens.widthScreen, Dimens.heightScreen),
      builder: () => MaterialApp(
        theme: Styles.mainTheme,
        title: Strings.appName,
        home: const MainScreen(),
      ),
    );
  }
}
