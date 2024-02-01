import 'package:buddy_ext/models/app_test.dart';
import 'package:buddy_ext/models/question.dart';
import 'package:buddy_ext/utils/constant.dart';
import 'package:buddy_ext/widgets/custom_btn.dart';
import 'package:buddy_ext/widgets/custom_text_field.dart';
import 'package:buddy_ext/widgets/summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _answerCtrl = TextEditingController();
  int _currentIndex = 0;
  List<Question> _results = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '(${_currentIndex + 1}/${questions.length})',
                      style: GoogleFonts.lato(color: Colors.grey),
                    ),
                    Text(
                      questions[_currentIndex].question,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const Gap(20.0),
                    CustomTextField(
                      controller: _answerCtrl,
                    ),
                    const Gap(20.0),
                    CustomBtn(
                      action: () {
                        if (_key.currentState!.validate()) {
                          String answer = _answerCtrl.text;
                          _results.add(
                              Question(
                                question: questions[_currentIndex].question,
                                answer: answer,
                              ),
                            );
                          if (_currentIndex != questions.length - 1) {
                            
                            setState(() {
                              _currentIndex++;
                            });
                          } else {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => SummaryCmp(
                                questions: _results,
                              ),
                              isScrollControlled: true
                            ).then((value) => setState(() {
                              _currentIndex = 0;
                              _results = [];
                            }));
                          }

                          _answerCtrl.clear();
                        }
                      },
                      label: AppText.nextLabel,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
