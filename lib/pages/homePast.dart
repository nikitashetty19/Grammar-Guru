import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipd/components/cards.dart';
import 'package:ipd/components/main_drawer.dart';
import 'package:ipd/constants/constants.dart';
import 'package:ipd/pages/login_page.dart';
import 'package:ipd/screens/analytics.dart';
import 'package:ipd/screens/gpt.dart';
import 'package:ipd/screens/sentence_puzzle.dart';

class HomePagel extends StatefulWidget {
  HomePagel({super.key});

  @override
  State<HomePagel> createState() => _HomePagelState();
}

class _HomePagelState extends State<HomePagel> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: signOut,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hi',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: kTextBlackColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Name',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: kTextBlackColor),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {}, //profile page
                      child: Container(
                        width: 110.0, // Adjust the width as needed
                        height: 110.0, // Adjust the height as needed
                        decoration: const BoxDecoration(
                          color:
                              kPrimaryColor, // Set this to your desired background color
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('lib/images/pngwing.com (1).png'),
                            fit: BoxFit.fill, // Adjust the fit as needed
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding)),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: kOtherColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 3),
                      topRight: Radius.circular(kDefaultPadding * 3),
                    )),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 25),
                  children: [
                    Row(
                      children: [
                        Cards(
                            text: 'Punctuation Guide',
                            icon: Icons.menu_book,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainDrawer(),
                                  ));
                            }),
                        const SizedBox(
                          width: 23,
                        ),
                        Cards(
                            text: "Test Yourself",
                            icon: Icons.mark_chat_read,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SentencePuzzle(),
                                  ));
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Cards(
                            text: "Individual Test",
                            icon: Icons.assignment,
                            onTap: () {}),
                        const SizedBox(
                          width: 23,
                        ),
                        Cards(
                            text: 'Analytics',
                            icon: Icons.book,
                            onTap: () {
                              //print("in");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnalyticsPage(),
                                  ));
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
