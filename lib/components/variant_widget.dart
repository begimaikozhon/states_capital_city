import 'package:flutter/material.dart';
import 'package:states_capital_city/constants/app_colors.dart';
import 'package:states_capital_city/models/questions.dart';

List<String> counties = ['Кыргызстан', 'Кытай', 'Россия', 'Америка'];

// ignore: must_be_immutable
class VariantWidget extends StatefulWidget {
  VariantWidget({
    super.key,
    required this.answer,
    required this.onTap,
  });

  final List<Answer> answer;
  final Function(bool) onTap;
  bool? isTrue;
  bool? isFalse;

  @override
  State<VariantWidget> createState() => _VariantWidgetState();
}

class _VariantWidgetState extends State<VariantWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 135,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final item = widget.answer[index];

          return InkWell(
            onTap: () {
              widget.onTap(item.isTrue);
              setState(() {
                widget.isTrue = true;
                widget.isFalse = false;
              });
            },
            child: Card(
              color: item.isTrue == widget.isTrue
                  ? AppColors.correct
                  : item.isTrue == widget.isFalse
                      ? AppColors.incorrect
                      : AppColors.inactive,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  item.text,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
