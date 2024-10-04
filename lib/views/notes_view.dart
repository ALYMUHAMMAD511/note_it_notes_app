import 'package:flutter/material.dart';

import 'package:note_it_app/widgets/add_note_modal_bottom_sheet.dart';
import 'package:note_it_app/widgets/custom_app_bar_title.dart';
import 'package:note_it_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          forceMaterialTransparency: true,
          title: const CustomAppBarTitle(),
        ),
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.indigo,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) => const AddNoteModalBottomSheet(),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
    );
  }
}
