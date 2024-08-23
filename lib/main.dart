import 'package:blockprec/bloc/Todo/bloc/to_do_bloc.dart';
import 'package:blockprec/bloc/counter/counter_bloc.dart';
import 'package:blockprec/bloc/imageupload/image_picker_block.dart';
import 'package:blockprec/bloc/switch/bloc/switch_bloc.dart';
import 'package:blockprec/ui/LoginScreen/login_screen.dart';
import 'package:blockprec/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/favourite/bloc/favourite_bloc.dart';
import 'bloc/post/bloc/bloc/post_bloc.dart';
import 'repositry/favourit_repo.dart';
import 'ui/Postscreen/post_screen.dart';

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
        BlocProvider(
          // create: (_) => CounterBloc(),
          create: (_) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBlock(ImagePic()),
        ),
        BlocProvider(
          create: (context) => ToDoBloc(),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(FavouritRepo()),
        ),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(
          title: 'bloc practice',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginScreen()
          // PostScreen()

          // FavouritScreen()
          // ToDoScreen()
          // HtmlScreen()
          // ImagePickerScreen()
          // SwitchScreen(),
          // const CounterScreen(),
          ),
    );
  }
}
