import 'package:bloc_practice/bloc/apibloc.dart';
import 'package:bloc_practice/bloc/apievent.dart';
import 'package:bloc_practice/utils/appColors.dart';
import 'package:bloc_practice/view/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ApiBloc()..add(const GetApiEvent(query: ''))),
          BlocProvider<RecipeBloc>(create: (context) => RecipeBloc(),),
          BlocProvider<FindByIngredientsBloc>(create: (context) => FindByIngredientsBloc(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            textTheme: TextTheme(
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: GoogleFonts.merriweather(color: Colors.white),
          displaySmall: GoogleFonts.pacifico(color: Colors.white),
        ),
            colorScheme: ColorScheme.fromSeed(seedColor: secondaryColor),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ));
  }
}
