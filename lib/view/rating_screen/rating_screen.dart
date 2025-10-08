import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_db.dart';
import 'package:quiz_app/view/homepage_screen/home_page.dart';

class RatingScreen extends StatelessWidget {
  final score;
  const RatingScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: List.generate(
              3,
              (starindex) => Padding(
                padding: EdgeInsets.only(bottom: starindex == 1 ? 20 : 0),
                child: Icon(
                  Icons.star,
                  size: starindex == 1 ? 90 : 50,
                  color: starindex < _persentageCount()
                      ? Colors.lightBlue.shade900
                      : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Congratulations",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.lightBlue.shade900,
            ),
          ),
          SizedBox(height: 20),

          Text(
            "Your score",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            "$score /${DummyDb.questions.length} ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.lightBlue.shade900,
            ),
          ),
          SizedBox(height: 30),

          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomepageScreen()),
              );
            },
            child: Container(
              width: 200,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:  Colors.lightBlue.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(Icons.replay_circle_filled,color: Colors.white,),
                  Text(
                    "Retry",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _persentageCount() {
    double perscount = (score / DummyDb.questions.length) * 100;
    if (perscount >= 80) {
      return 3;
    } else if (perscount >= 50) {
      return 2;
    } else if (perscount >= 30) {
      return 1;
    } else {
      return 0;
    }
  }
}
