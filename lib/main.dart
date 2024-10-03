import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_it_app/constants.dart';
import 'package:note_it_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_it_app/models/note_model.dart';
import 'package:note_it_app/simple_bloc_observer.dart';
import 'package:note_it_app/views/notes_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NoteItApp());
}

class NoteItApp extends StatelessWidget {
  const NoteItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: const NotesView(),
      ),
    );
  }
}
