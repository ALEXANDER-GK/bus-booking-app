import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'otherpages/payment.dart';

class card extends StatefulWidget {
  const card({Key? key}) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 118, 128, 243),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Card',
            style: GoogleFonts.pacifico(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
            width: 300,
            height: 200,
            padding: const EdgeInsets.all(10.0),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color.fromARGB(255, 110, 157, 233),
                elevation: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Text(
                        "mailid",
                        style: GoogleFonts.pacifico(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      child: QrImage(
                        data: "hello",
                        size: 100,
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
