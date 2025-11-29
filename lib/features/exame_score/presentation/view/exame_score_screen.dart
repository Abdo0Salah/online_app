import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/colors_manager.dart';
import 'model.dart';

class ScoreWidget extends StatelessWidget {
  ScoreModel scoreModel = ScoreModel(correct: 5, incorrect: 25, total: "16.6%");

  @override
  Widget build(BuildContext context) {
    int total = (scoreModel.incorrect) + (scoreModel.correct);
    double percent = scoreModel.correct / total;
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam score", style: AppStyles.font20BlackW500()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your score", style: AppStyles.font18BlackW500()),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 10,
                    percent: percent,
                    animateFromLastPercent: true,
                    animation: true,
                    animationDuration: 1500,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      scoreModel.total,
                      style: AppStyles.font20BlackW500(),
                    ),
                    backgroundColor:ColorsManager.error,
                    progressColor: ColorsManager.myBlue,
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Correct",
                            style: AppStyles.font16BlackW500().copyWith(
                              color: ColorsManager.myBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorsManager.myBlue,
                                width: 3,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${scoreModel.correct}",
                              style: AppStyles.font16BlackW500().copyWith(
                                color: ColorsManager.myBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const Text(
                            "Incorrect",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorsManager.error,
                                width: 3,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${scoreModel.incorrect}",
                              style: AppStyles.font16BlackW500().copyWith(
                                color: ColorsManager.error,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
