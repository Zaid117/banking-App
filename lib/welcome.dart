import 'main.dart';
import 'registeration.dart';
import 'package:flutter/material.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Container(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/img.png'),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          const Text(
            'Lets Get Started !',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Never a better time than now  to start \nThinking about how to manage all finances.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7A66FF),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Registration()),
              );
            },
            child: Container(
              width: 220,
              height: 50,
              child: Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Login to Account',
            style: TextStyle(
              color: Color(0xFF7A66FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
