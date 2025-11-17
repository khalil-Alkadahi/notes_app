
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'color_list_view.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex ;
  @override
  void initState() {
    currentIndex=kColor.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color=kColor[index].toARGB32();

                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: kColor[index],
              ),
            ),
          );
        },
        itemCount: kColor.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
