import 'package:flutter/material.dart';
import 'package:ipd/components/comma.dart';
import 'package:ipd/components/exclamation.dart';
import 'package:ipd/components/fullstop.dart';
import 'package:ipd/components/AttractiveTestDisplay.dart';
import 'package:ipd/components/question_mark.dart';
import 'package:ipd/pages/homePast.dart';
import 'package:ipd/pages/homePage.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  // void _selectedpunctuation(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (ctx) => const Exclamation(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Drop & Drag',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.pink.shade100),
      body: Container(
        color: Colors.pink.shade100,
        alignment: Alignment.center,
        child: AttractiveTextDisplay(),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 245, 113, 157),
                  Color.fromARGB(255, 233, 235, 239)
                ],
              ),
            ),
            child: Row(children: [
              Text(
                'Priyal',
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(
                width: 50,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
                // Replace with your image URL.
              ),
            ]),
          ),
          ListTile(
            leading: Icon(Icons.question_mark_outlined, color: Colors.white),
            title: Text('Question Mark'),
            tileColor: Colors.pink.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => QuestionScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.format_list_numbered, color: Colors.white),
            title: Text('comma'),
            tileColor: Colors.pink.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CommaScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.sentiment_very_satisfied, color: Colors.white),
            title: Text('Exclamation Mark'),
            tileColor: Colors.pink.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ExclamationScreen(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
              leading: Icon(Icons.circle_sharp, color: Colors.white),
              title: Text('Full Stop'),
              tileColor: Colors.pink.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => FullStopScreen(),
                  ),
                );
              }),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Home Page'),
            tileColor: Colors.pink.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.white),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
                ),
              );
              // Handle the click action for the Full Stop
            },
          ),
        ],
      )),
    );
  }
}
