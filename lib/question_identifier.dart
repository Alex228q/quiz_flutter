import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(this.isCorrect, this.questionsIndex, {super.key});
  final bool isCorrect;
  final int questionsIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(255, 23, 87, 8)
            : const Color.fromARGB(255, 137, 20, 16),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionsIndex.toString(),
        style: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
