import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_it_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_it_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_it_app/helper/helper_functions.dart';
import 'package:note_it_app/widgets/add_notes_form.dart';

class AddNoteModalBottomSheet extends StatelessWidget {
  const AddNoteModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        builder: (context, state) =>
            AbsorbPointer(
              absorbing: state is AddNoteLoadingState ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom,
                ),
                child: const SingleChildScrollView(
                  child: AddNotesForm(),
                ),
              ),
            ),
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            showSnackBar(
              context,
              'There is an Error when Adding the Note',
              Colors.red,
            );
          }
          if (state is AddNoteSuccessState) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            showSnackBar(
                context,
                'Note has been Added Successfully',
                Colors.green,
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
