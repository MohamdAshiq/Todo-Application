import 'package:flutter/material.dart';

class ExpandableTileWidget extends StatelessWidget {
  const ExpandableTileWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        collapsedTextColor: Colors.white,
        textColor: Colors.white,
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text(
          "Task ${index + 1}",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle:  Text(
          "Description ${index+1} ",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey[700],
          foregroundColor: Colors.white,
          child:  Text("${index+1}"),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              5,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text("Data ${index + 1}  : "),
              ),
            ),
          )
        ],
      ),
    );
  }
}
