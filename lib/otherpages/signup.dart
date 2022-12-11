import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid/otherpages/verify.dart';

String email = '';

class signUp extends StatefulWidget {
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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

  final _auth = FirebaseAuth.instance;

  String password = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 118, 128, 243),
          title: Text("Signup",
              style: GoogleFonts.pacifico(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ))),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Color.fromARGB(224, 4, 0, 7)),
                decoration: const InputDecoration(
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
                    borderSide: BorderSide(color: Colors.white38, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username cannot be empty";
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
                style: const TextStyle(color: Color.fromARGB(224, 4, 0, 7)),
                decoration: const InputDecoration(
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
                    borderSide: BorderSide(color: Colors.white38, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  } else if (value.length < 7) {
                    return "Length of password must be greater than 6";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    password = value.trim();
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 25),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final newUser = await _auth
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .then((_) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => VerifyScreen())));
                        FirebaseFirestore.instance
                            .collection('profile')
                            .add({'email': '$email', 'name:': funct(email)});
                      });
                    } catch (e) {
                      Text("Invalid Email",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20));
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Color.fromARGB(255, 125, 99, 117);
                      return Color.fromARGB(255, 118, 128, 243);
                    },
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
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
      ),
    );
  }
}
