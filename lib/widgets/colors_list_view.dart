import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_it_app/constants.dart';
import 'package:note_it_app/widgets/color_item.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        itemBuilder:(context, index) => GestureDetector(
          onTap: ()
          {
            currentIndex = index;
            BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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
