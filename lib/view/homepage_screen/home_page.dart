import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/dummy_db.dart';

import 'package:quiz_app/view/rating_screen/rating_screen.dart';

class HomepageScreen extends StatefulWidget {
  HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int questionindex = 0;
  int? clickedindex;
  int correctAnswer = 0;
  static const int totalTime = 30;
  int remainingTime = totalTime;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
  timer?.cancel(); // cancel any existing timer
  setState(() {
    remainingTime = totalTime; // reset time
  });

  timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (remainingTime > 0) {
      setState(() {
        remainingTime--;
      });
    } else {
      timer.cancel();

      //  When timer hits 0, move to next question automatically
      if (questionindex + 1 < DummyDb.questions.length) {
        setState(() {
          questionindex++;
          clickedindex = null;
        });
        startTimer(); // restart timer for next question
      } else {
        // When quiz ends
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RatingScreen(score: correctAnswer),
          ),
        );
      }
    }
  });
}


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // Change color based on remaining time
  Color getColor() {
    if (remainingTime > 20) {
      return Colors.green;
    } else if (remainingTime > 10) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = remainingTime / totalTime;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "${questionindex + 1}/${DummyDb.questions.length}",
              style: TextStyle(
                color: Colors.lightBlue.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade900,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Timer at the top
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 6,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                getColor(),
                              ),
                            ),
                          ),
                          Text(
                            "$remainingTime",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //  question content here
                    Expanded(
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          DummyDb.questions[questionindex].question,
                          style: GoogleFonts.michroma(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //  Use List.generate here with help of spread operator
            ...List.generate(
              DummyDb.questions[0].options.length,
              (index) => InkWell(
                onTap: () {
                  //  for ensure that user can click one option per a question
                  if (clickedindex == null) {
                    clickedindex = index;
                    // for know the score
                    if (clickedindex ==
                        DummyDb.questions[questionindex].answerindex) {
                      correctAnswer++;
                    }
                 
                    setState(() {});
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: _buildcontainerColor(index),
                    border: Border.all(color: Colors.lightBlue.shade900),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          DummyDb.questions[questionindex].options[index],
                          style: TextStyle(
                            color: Colors.lightBlue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.circle_outlined,
                          color: Colors.lightBlue.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (clickedindex !=
                null) // for dont show next until its clicked or we can use visibility operator
              InkWell(
                onTap: () {
                  clickedindex =
                      null; // for not show the color of options when comes to next question
                  if (questionindex + 1 < DummyDb.questions.length) {
                    questionindex++; // move to next question until the question is completed 15/15
                  } else {
                    Navigator.pushReplacement(
                      context,
                      DialogRoute(
                        context: context,
                        builder: (context) =>
                            RatingScreen(score: correctAnswer),
                      ),
                    );
                  }
                  startTimer();

                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 162, 153, 68),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Color? _buildcontainerColor(int index) {
  //  if (clickedindex != null) {
  //     if (index == DummyDb.questions[questionindex].answerindex) {
  //       return Colors.greenAccent;
  //     }
  //   }
  //   if (clickedindex == DummyDb.questions[questionindex].answerindex &&
  //       clickedindex == index) {
  //     return Colors.greenAccent;
  //   } else if (clickedindex != DummyDb.questions[questionindex].answerindex &&
  //       clickedindex == index) {
  //     return Colors.redAccent;
  //   } else {
  //     return null;
  //   }
  // }

  Color? _buildcontainerColor(int index) {
    // show right answer when anyone of the option is clicked
    if (clickedindex != null) {
      if (index == DummyDb.questions[questionindex].answerindex) {
        return Colors.greenAccent;
      }
    }
    //  show red if the clicked answer is wrong show green if the answer is correct
    if (clickedindex == index) {
      if (clickedindex == DummyDb.questions[questionindex].answerindex &&
          clickedindex == index) {
        return Colors.greenAccent;
      } else {
        return Colors.redAccent;
      }
    }
    // other wise show nothing
    return null;
  }


}
