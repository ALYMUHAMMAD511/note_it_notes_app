import 'package:flutter/material.dart';
import 'package:note_it_app/models/note_model.dart';
import '../constants.dart';
import 'color_item.dart';

class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {

  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        itemBuilder:(context, index) => GestureDetector(
          onTap: ()
          {
            currentIndex = index;
            widget.note.color = kColors[index].value;
            setState(() {});
          },
          child: ColorItem(
            isActive: currentIndex == index,
            color: kColors[index],
          ),
        ),
        itemCount: kColors.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
      ),
    );
  }
}
