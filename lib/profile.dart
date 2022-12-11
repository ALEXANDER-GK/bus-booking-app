import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid/login_page.dart';
import 'otherpages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:rapid/login_page.dart';

void main() {
  runApp(profile());
}

String _name = "";
String user_name = "";
String user_mail = "";

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String funct(String s) {
    String res = '';
    for (int i = 0; i < s.length; i++) {
      if (s[i] != '@') {
        res += s[i];
      } else {
        break;
      }
    }
    return res;
  }

  final auth = FirebaseAuth.instance;

  // @override
  // getData() async {
  //   DocumentSnapshot variable = await FirebaseFirestore.instance
  //       .collection("profile")
  //       .doc(auth.currentUser!.uid)
  //       .get();

  //   setState(() {
  //     user_name = variable["name"];
  //     user_mail = variable["email"];
  //   });
  // }

  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 128, 243),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Profile',
            style: GoogleFonts.pacifico(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              height: MediaQuery.of(context).size.height * 0.28,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Stack(
                //overflow: Overflow.visible,
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(20)),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        height: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 118, 128, 243),
                                width: 4),
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/chigari_bus.jpg"))),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Color.fromARGB(255, 255, 255, 255);
                              return Color.fromARGB(255, 118, 128, 243);
                            },
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //     StreamBuilder(
                    //         stream: FirebaseFirestore.instance
                    //             .collection('profile')
                    //             .snapshots(),
                    //         builder: (BuildContext context,
                    //             AsyncSnapshot<QuerySnapshot> snapshot) {
                    //           if (!snapshot.hasData) {
                    //             return Center(
                    //               child: CircularProgressIndicator(),
                    //             );
                    //           }
                    // }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Name: " + funct(email),
                            style: GoogleFonts.podkova(
                              fontStyle: FontStyle.normal,
                              color: Color.fromARGB(255, 118, 128, 243),
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Container(
                      child: Text(
                        "Mail : $email",
                        style: GoogleFonts.podkova(
                          fontStyle: FontStyle.normal,
                          color: Color.fromARGB(255, 118, 128, 243),
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      color: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => login_page(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Color.fromARGB(255, 174, 94, 141);
                              return Color.fromARGB(255, 118, 128, 243);
                            },
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
