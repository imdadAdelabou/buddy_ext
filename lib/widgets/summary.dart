import 'package:buddy_ext/models/app_test.dart';
import 'package:buddy_ext/models/question.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryCmp extends StatelessWidget {
  final List<Question> questions;
  const SummaryCmp({
    super.key,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(10.0),
            Text(
              AppText.resume,
              style: GoogleFonts.lato(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20.0),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}',
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                        ),
                      ),
                      const Gap(8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .8,
                            child: Text(
                              questions[index].question,
                              style: GoogleFonts.lato(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          const Gap(4.0),
                          Text(questions[index].answer!),
                        ],
                      )
                    ],
                  ),
                  const Gap(10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
