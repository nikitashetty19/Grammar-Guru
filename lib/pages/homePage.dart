import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipd/components/cards.dart';
import 'package:ipd/components/main_drawer.dart';
import 'package:ipd/constants/constants.dart';
import 'package:ipd/pages/login_page.dart';
import 'package:ipd/screens/analytics.dart';
import 'package:ipd/screens/chatScreen.dart';
import 'package:ipd/screens/gpt.dart';
import 'package:ipd/screens/sentence_puzzle.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppBarSection(),
              GreetingSection(),
              MainImageSection(),
              StartJourneyText(),
              ButtonsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarSection extends StatelessWidget {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink.shade50,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 56.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.home, color: Colors.black, size: 30),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: signOut,
          ),
        ],
      ),
    );
  }
}

class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pink.shade100, // Placeholder color
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hi Priya!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                Text(
                  "Let's begin with increasing your proficiency in English language.",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          // Placeholder for profile picture
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey, // Placeholder color
            ),
          ),
        ],
      ),
    );
  }
}

class MainImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.pink.shade100, // Placeholder color
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }
}

class StartJourneyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Start your journey here.',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}

class ButtonsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GridView.count(
        shrinkWrap: true,
        physics:
            NeverScrollableScrollPhysics(), // to disable GridView's scrolling
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: <Widget>[
          JourneyButton(
            icon: Icons.bookmark_border,
            label: 'Punctuation Guide',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainDrawer(),
                  ));
            },
          ),
          JourneyButton(
            icon: Icons.edit,
            label: 'Self Practice',
            onTap: () {},
          ),
          JourneyButton(
            icon: Icons.check_circle_outline,
            label: 'Test Yourself',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SentencePuzzle(),
                  ));
            },
          ),
          JourneyButton(
            icon: Icons.bar_chart,
            label: 'Analysis',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnalyticsPage(),
                  ));
            },
          ),
          JourneyButton(
            icon: Icons.lightbulb_outline,
            label: 'chatbot',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ));
            },
          ),
          JourneyButton(
            icon: Icons.check,
            label: 'Intellect Check',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class JourneyButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  JourneyButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 32.0, color: Colors.black),
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
