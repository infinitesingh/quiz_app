import 'package:flutter/material.dart';
import 'dart:async';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> options = ['Option A', 'Option B', 'Option C', 'Option D'];
  int selectedOptionIndex = -1;
  int secondsRemaining = 60; // Initial timer duration
  int questionNumber = 1; // Track the question number

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          // Timer has expired, implement your logic here
          timer.cancel();
          showExplanation();
        }
      });
    });
  }

  void showExplanation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Explanation'),
          content: Text('The correct answer is Paris.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the explanation dialog
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      });
  }

  void goToNextQuestion() {
    // You would have a mechanism to navigate to the next question here.
    // For example, you could increment the questionNumber and load the next question.
  }

  void submitAnswer() {
    // You can add your answer submission logic here.
    // For now, we'll just show the explanation.
    showExplanation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Question $questionNumber'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Question $questionNumber: What is the capital of France?',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Text(
            'Time Remaining: $secondsRemaining seconds',
            style: TextStyle(fontSize: 16),
          ),
          for (int i = 0; i < options.length; i++)
            OptionCard(
              option: options[i],
              isSelected: selectedOptionIndex == i,
              onTap: () {
                setState(() {
                  selectedOptionIndex = i;
                });
              },
            ),
          ElevatedButton(
            onPressed: submitAnswer,
            child: Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () {
              // Pause the timer
              _timer.cancel();
            },
            child: Text('Pause'),
          ),
          TextButton(
            onPressed: () {
              // Navigate to the next question
              goToNextQuestion();
            },
            child: Text('Next Question'),
          ),
          TextButton(
            onPressed: () {
              // Navigate back to the home screen
              Navigator.pop(context);
            },
            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  OptionCard({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.blue : Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 300,
          height: 50,
          alignment: Alignment.center,
          child: Text(option),
        ),
      ),
    );
  }
}