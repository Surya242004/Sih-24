import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetStartedPage(),
    );
  }
}

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Train animation
            Lottie.asset(
              'assets/train.json', // Use Lottie animation or any other you prefer
              height: 300,
            ),
            const SizedBox(height: 50),
            // Row with the custom "Get Started" button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleElevatedButton(
                  color: Colors.green,
                  onPressed: () {
                    // Navigate to RailMadadPremium UI
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RailMadadPremium(),
                      ),
                    );
                  },
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom button widget
class SimpleElevatedButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final Widget child;

  const SimpleElevatedButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      child: child,
    );
  }
}

// RailMadadPremium UI (The one I provided previously)
class RailMadadPremium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Lottie.asset('assets/train2.json',
                height: 40), // Animated Train in the header
            SizedBox(width: 8),
            Text('ROXX'),
          ],
        ),
        backgroundColor: Colors.red[800],
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              // Call action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get instant help for train related complaint',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 20),

            // Complaint Dropdown
            buildDropdownField('Complaint'),
            SizedBox(height: 12),

            // Sub Complaint Dropdown
            buildDropdownField('Sub Complaint'),
            SizedBox(height: 12),

            // Date Picker
            GestureDetector(
              onTap: () {
                // Select date action
              },
              child: buildTextField('Incident Date', '16/09/2024 12:41 PM'),
            ),
            SizedBox(height: 12),

            // Description
            buildTextField('Complaint Description', 'Describe your complaint'),
            SizedBox(height: 12),

            // Journey Details
            buildTextField('Journey Details', 'Train Number, PNR, etc.'),
            SizedBox(height: 20),

            // File upload buttons with animations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    // Camera action
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.file_upload),
                  label: Text('Upload'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    // Upload action
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Only JPG, JPEG and PNG images are allowed (Max Size: 5MB).',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Submit Button with animation
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Submit action with animation
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: Lottie.asset('assets/submit_loading.json',
                            height: 100),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: SizedBox(),
            items: ['Option 1', 'Option 2'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }

  Widget buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
          ),
        ),
      ],
    );
  }
}
