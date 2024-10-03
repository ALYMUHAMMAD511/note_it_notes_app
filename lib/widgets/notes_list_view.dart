import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_it_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_it_app/models/note_model.dart';
import 'notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                NotesItem(
                    note: notes[index],
                ),
            itemCount: notes.length,
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 20,
            ),
          ),
        );
      },
    );
  }
}
