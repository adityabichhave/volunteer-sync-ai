import 'package:flutter/material.dart';
import 'data.dart';

class NgoScreen extends StatefulWidget {
  @override
  _NgoScreenState createState() => _NgoScreenState();
}

class _NgoScreenState extends State<NgoScreen> {
  final typeController = TextEditingController();
  final locationController = TextEditingController();
  final urgencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NGO - Add Requirement"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: typeController,
              decoration: InputDecoration(labelText: "Problem Type"),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: "Location"),
            ),
            TextField(
              controller: urgencyController,
              decoration: InputDecoration(labelText: "Urgency"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ngoRequests.add({
                  "type": typeController.text,
                  "location": locationController.text,
                  "urgency": urgencyController.text,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Request Saved")),
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