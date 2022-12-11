import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPage extends StatefulWidget {
  ResetPage({Key? key}) : super(key: key);
  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final _auth = FirebaseAuth.instance;
  String _email = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 118, 128, 243),
            title: Text("password reset",
                style: GoogleFonts.pacifico(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ))),
        body: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email Id",
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(fontSize: 23),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username cannot be empty";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Container(
              color: Color.fromARGB(255, 118, 128, 243),
              child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _auth.sendPasswordResetEmail(email: _email);

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Reset Link has been sent to mail",
                        //style: TextStyle(color: Colors.white),
                      ),
                      // backgroundColor: Colors.black,
                    ));
                    Future.delayed(Duration(milliseconds: 1000), () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    });
                  }
                },
                child: const Text(
                  "Send Reset Link",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ));
  }
}
