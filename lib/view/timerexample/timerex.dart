import 'dart:async';
import 'package:flutter/material.dart';

class TimerAtTopContainer extends StatefulWidget {
  const TimerAtTopContainer({super.key});

  @override
  State<TimerAtTopContainer> createState() => _TimerAtTopContainerState();
}

class _TimerAtTopContainerState extends State<TimerAtTopContainer> {
  static const int totalTime = 30;
  int remainingTime = totalTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          t.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
      appBar: AppBar(title: const Text("Timer at Top")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    // 👇 Timer at the top
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 8,
                              backgroundColor: Colors.grey.shade300,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(getColor()),
                            ),
                          ),
                          Text(
                            "$remainingTime s",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 👇 Add your question or other content here
                    const Text(
                      "This is your question text area.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
