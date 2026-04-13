import 'package:flutter/material.dart';
import 'data.dart';
import 'ai_service.dart';

class MatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 🔥 Smart Matching Logic
    List<Map<String, String>> matched = [];

    if (ngoRequests.isNotEmpty) {
      String need = ngoRequests.last["type"]!.toLowerCase();

for (var v in volunteers) {
  String skill = v["skills"]!.toLowerCase();

  if ((need.contains("education") || need.contains("teach")) &&
      (skill.contains("teach"))) {
    matched.add(v);
  } else if ((need.contains("food") || need.contains("lunch")) &&
      (skill.contains("cook") || skill.contains("chef"))) {
    matched.add(v);
  } else if ((need.contains("health") || need.contains("medical")) &&
      (skill.contains("medical") || skill.contains("doctor"))) {
    matched.add(v);
  }
}
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("AI Matching"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔥 Show Current Need
            if (ngoRequests.isNotEmpty)
              Text(
                "Current Need: ${ngoRequests.last["type"]} (${ngoRequests.last["urgency"]})",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

            SizedBox(height: 15),


Text(
  "AI-powered recommendation based on needs",
  style: TextStyle(color: Colors.grey),
),
            // 🤖 Gemini AI Button
            ElevatedButton(
              onPressed: () async {
  try {
    String need = ngoRequests.isNotEmpty
        ? ngoRequests.last["type"]!
        : "No need";

    String volunteersData = volunteers.toString();

    String result = await AIService.getMatchSuggestion(
        need, volunteersData);

    print(result); // 👈 IMPORTANT

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("AI Suggestion"),
        content: Text(result),
      ),
    );
  } catch (e) {
    print(e); // 👈 show error in terminal
  }
},
              child: Text("Get AI Suggestion"),
            ),

            SizedBox(height: 15),

            // 📋 Matching List
            Expanded(
              child: matched.isEmpty
                  ? Center(
                      child: Text(
                        "No suitable volunteers found",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: matched.length,
                      itemBuilder: (context, index) {
                        final v = matched[index];

                        return Card(
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text(v["name"] ?? ""),
                            subtitle: Text(
                              "Skill: ${v["skills"]}\nAvailable: ${v["availability"]}",
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}