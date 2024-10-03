import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_it_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_it_app/views/notes_search_view.dart';
import 'package:note_it_app/widgets/custom_icon.dart';
import 'package:note_it_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {

  @override
  void initState()
  {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomIcon(
                icon: Icons.search,
                onPressed: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotesSearchView(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}