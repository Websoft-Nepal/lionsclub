import 'package:flutter/material.dart';
// import 'package:lionsclub/Home/slider.dart';?
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lionsclub/view_model/FocusProgram.dart';
import 'package:lionsclub/view_model/NewsEvents.dart';
import 'Screens/Home/home.dart';
import 'package:provider/provider.dart';
const Color pColor = Color(0xFFFCCB08);
const Color sColor = Color(0xFF11468F);
const Color tColor = Color(0xFF141414);
const Color ttColor = Color(0xFF666666);
const Color bColor = Color(0xFFEEEEEE);
const Color zColor = Color(0xFFFF6347);
const Color btnBg = Color(0xFFF8F2ED);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProgramProvider()),
      ChangeNotifierProvider(create: (_) => NewsEventsProvider())
    ],
    child:MyApp(),
    )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'LEO CLUB',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        // primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFCCB08)),
        primaryColor: pColor,
        useMaterial3: true,

      ),
      home: const Home1(),
    );
  }
}

