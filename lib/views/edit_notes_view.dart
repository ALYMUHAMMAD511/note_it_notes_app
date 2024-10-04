import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_it_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_it_app/models/note_model.dart';
import 'package:note_it_app/widgets/custom_icon.dart';
import 'package:note_it_app/widgets/edit_note_colors_list_view.dart';

import '../helper/helper_functions.dart';
import '../widgets/custom_text_form_field.dart';

class EditNotesView extends StatefulWidget {
  const EditNotesView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesView> {
  String? title;
  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Edit Note',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              showSnackBar(
                context,
                'Note has been Edited Successfully',
                Colors.green,
              );
              Navigator.pop(context);
            },
            icon: const CustomIcon(icon: Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CustomTextFormField(
              hint: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hint: widget.note.subTitle,
              maxLines: 5,
              onChanged: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            EditNoteColorsListView(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}
