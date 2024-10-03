import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../models/note_model.dart';

void showSnackBar(BuildContext context, String message, Color color)
{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
    ),
  );
}

void showDeleteConfirmationDialog(BuildContext context, NoteModel note)
{
  showDialog(
    context: context,
    builder: (BuildContext context)
    {
      return AlertDialog(
        title: const Text(
          'Delete Note',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: const Text('Are you sure you want to Delete this Note?'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: ()
            {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              note.delete();
              showSnackBar(
                context,
                'Note has been Deleted Successfully',
                Colors.green,
              );
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}