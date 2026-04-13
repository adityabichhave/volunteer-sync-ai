import 'package:flutter/material.dart';
import 'data.dart';

class VolunteerScreen extends StatefulWidget {
  @override
  _VolunteerScreenState createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  final nameController = TextEditingController();
  final skillController = TextEditingController();
  final availabilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer Registration"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: skillController,
              decoration: InputDecoration(labelText: "Skills"),
            ),
            TextField(
              controller: availabilityController,
              decoration: InputDecoration(labelText: "Availability"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                volunteers.add({
                  "name": nameController.text,
                  "skills": skillController.text,
                  "availability": availabilityController.text,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Volunteer Saved")),
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}