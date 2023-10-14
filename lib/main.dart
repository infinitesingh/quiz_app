import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue, // Set the primary color
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Your Progress: 40%', // Add your actual progress here
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Text color
              ),
            ),
          ),
          Text(
            'Categories:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20), // Increased spacing
          Wrap(
            spacing: 20, // Increased spacing
            runSpacing: 20, // Increased spacing
            children: <Widget>[
              CategoryCard('Category 1'),
              CategoryCard('Category 2'),
              CategoryCard('Category 3'),
              CategoryCard('Category 4'),
              CategoryCard('Category 5'),
              CategoryCard('Category 6'),
            ],
          ),
          SizedBox(height: 20),
          DailyQuestionCard(),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;

  CategoryCard(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue, // Category card background color
      child: InkWell(
        onTap: () {
          openQuiz(context, 1);
        },
        child: Container(
          width: 120, // Adjusted card width
          height: 120, // Adjusted card height
          alignment: Alignment.center,
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 20, // Increased font size
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }
}

void openQuiz(BuildContext context, int i) {
  if (i == 1) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizScreen()));
  }
}

class DailyQuestionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue, // Daily question card background color
      child: InkWell(
        onTap: () {
          // Navigate to the daily question
        },
        child: Container(
          width: 300,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            'Daily Question',
            style: TextStyle(
              fontSize: 18, // Increased font size
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
