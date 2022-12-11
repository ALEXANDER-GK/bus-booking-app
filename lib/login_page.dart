import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rapid/otherpages/resetPass.dart';
import 'package:rapid/otherpages/signup.dart';
import 'controller/page_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart';

bool res = false;

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  bool? _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 118, 128, 243),
          title: Center(
            child: Text(
              "Chigari",
              style: GoogleFonts.pacifico(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 30,
                letterSpacing: 1,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 118, 128, 243),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/chigari_bus.jpg"),
                        maxRadius: 70,
                        minRadius: 10,
                        backgroundColor: Color.fromARGB(255, 126, 88, 145),
                        foregroundColor: Color.fromARGB(255, 126, 88, 145),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Color.fromARGB(224, 4, 0, 7)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_rounded,
                          color: Color.fromARGB(255, 118, 128, 243),
                        ),
                        labelText: "Mail",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(224, 3, 0, 5),
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white38, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value.trim();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      obscureText: !_showPassword!,
                      style: TextStyle(color: Color.fromARGB(224, 4, 0, 7)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          color: Color.fromARGB(255, 118, 128, 243),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(224, 3, 0, 5),
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white38, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value.trim();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Color.fromARGB(255, 255, 255, 255),
                          fillColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 118, 128, 243)),
                          value: _showPassword,
                          onChanged: (newValue) {
                            setState(() {
                              _showPassword = !_showPassword!;
                            });
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword!;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                          ),
                          child: Text(
                            'Show Password',
                            style: TextStyle(
                              color: Color.fromARGB(255, 118, 128, 243),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8.5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResetPage()));
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 118, 128, 243),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 25),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _auth
                                  .signInWithEmailAndPassword(
                                      email: email, password: password)
                                  .then((_) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            page_controller(0))));
                                //await getData();
                                setState(() {
                                  res = true;
                                });
                              });
                              // if (res == false) {
                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(const SnackBar(
                              //     content: Text(
                              //       "Email invalid or Email not registered or Password Incorrect",
                              //     ),
                              //   ));
                              // }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Color.fromARGB(255, 125, 99, 117);
                                return Color.fromARGB(255, 118, 128, 243);
                              },
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 25),
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signUp(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Color.fromARGB(255, 125, 99, 117);
                                return Color.fromARGB(255, 118, 128, 243);
                              },
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ])),
      ),
    );
  }
}
