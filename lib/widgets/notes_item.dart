import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_it_app/models/note_model.dart';
import 'package:note_it_app/views/edit_notes_view.dart';

import '../helper/helper_functions.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNotesView(note: note),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 24,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16,),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                trailing: IconButton(
                    onPressed: ()
                    {
                      showDeleteConfirmationDialog(context, note);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                      size: 26,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                ),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
