import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_it_app/views/edit_notes_view.dart';
import 'package:note_it_app/widgets/custom_text_form_field.dart';
import 'package:note_it_app/widgets/notes_item.dart';
import '../constants.dart';
import '../models/note_model.dart';

class NotesSearchView extends StatefulWidget {
  const NotesSearchView({super.key});

  @override
  NotesSearchViewState createState() => NotesSearchViewState();
}

class NotesSearchViewState extends State<NotesSearchView> {
  late Box<NoteModel> notesBox;
  List<NoteModel> searchResults = [];

  @override
  void initState() {
    super.initState();
    notesBox = Hive.box<NoteModel>(kNotesBox);
  }

  void search(String query) {
    setState(() {
      searchResults = notesBox.values.where((item)
      {
        return item.title.toLowerCase().contains(query) || item.subTitle.toLowerCase().contains(query);
      }).toList();
    });
  }

  void navigateToEditNoteView(NoteModel note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNotesView(note: note),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 70,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    IconButton(
                        onPressed: ()
                        {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 26,
                        ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        hint: 'Search for a Note',
                        onChanged: search,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()
                        {
                          navigateToEditNoteView(searchResults[index]);
                        },
                        child: NotesItem(
                          note: searchResults[index],
                        ),
                      );
                    },
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