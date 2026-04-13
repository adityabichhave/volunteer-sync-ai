import 'package:flutter/material.dart';
import 'ngo_screen.dart';
import 'volunteer_screen.dart';
import 'match_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VolunteerSync AI"),
        centerTitle: true,
      ),
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.volunteer_activism, size: 80, color: Colors.blue),
      SizedBox(height: 20),

      Text(
        "VolunteerSync AI",
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),

      SizedBox(height: 10),

      Text(
        "Smart Resource Allocation",
        style: TextStyle(color: Colors.grey),
      ),

      SizedBox(height: 40),

      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NgoScreen()),
          );
        },
        child: Text("NGO"),
      ),

      SizedBox(height: 20),

      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VolunteerScreen()),
          );
        },
        child: Text("Volunteer"),
      ),

      SizedBox(height: 20),

      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MatchScreen()),
          );
        },
        child: Text("View Matches"),
      ),
    ],
  ),
),
    );
  }
}