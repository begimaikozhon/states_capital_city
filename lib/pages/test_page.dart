import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:states_capital_city/app/app.dart';
import 'package:states_capital_city/components/appbar_title_widget.dart';
import 'package:states_capital_city/components/slider_widget.dart';
import 'package:states_capital_city/components/variant_widget.dart';
import 'package:states_capital_city/models/questions.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key, required this.quetion}) : super(key: key);

  final List<Question> quetion;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;
  int trueAnswer = 0;
  int lives = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleWidget(
          questionLength: index + 1,
          trueAnswer: trueAnswer,
          answerNumber: index + 1,
          continentQuestionLength: widget.quetion.length,
          lives: lives,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SliderWidget(
              value: index,
              continentQuestionLength: widget.quetion.length,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.quetion[index].text,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/${widget.quetion[index].image}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            VariantWidget(
              answer: widget.quetion[index].answer,
              onTap: (isTrue) async {
                AudioPlayer().play(AssetSource('notes/zvuk.mp3'));
                if (index + 1 == widget.quetion.length || lives == 0) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Результат теста:',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        content: Text(
                          'Правильные ответы: $trueAnswer',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                index = 0;
                                trueAnswer = 0;
                                lives = 3;
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Начать снова',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const MyApp()));
                            },
                            child: const Text(
                              'Меню',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  await Future.delayed(const Duration(seconds: 1));
                  if (isTrue == true) {
                    trueAnswer++;
                  } else {
                    trueAnswer == 0;
                    lives--;
                  }
                  setState(
                    () {
                      index++;
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
