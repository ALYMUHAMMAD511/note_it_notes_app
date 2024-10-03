import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_it_app/constants.dart';
import 'package:note_it_app/models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitialState());

  Color color =  const Color(0xff3F51B5);

  addNote(NoteModel note) async
  {
    note.color = color.value;
    emit(AddNoteLoadingState());
    try
    {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    }
    catch (e)
    {
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
