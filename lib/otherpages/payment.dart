import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid/otherpages/stations.dart';
import 'package:rapid/trips.dart';
import 'distance.dart';
import 'package:rapid/otherpages/distance.dart';
import 'package:rapid/search_page.dart';
import '../controller/page_controller.dart';

//list to store all sources and destinations for which trip has been reserved as well as to store the history
List<String> all_src = <String>[];
List<String> all_dst = <String>[];

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    int? dist = distance[Source];
    int? dist2 = distance[destination];
    double f_dist = ((dist! - dist2!) * rate).abs();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 128, 243),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Payment',
            style: GoogleFonts.pacifico(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFF2ECAF2),
                    Color(0XFFADFED4),
                    //Color(0XFFD4FFF3)
                  ]),
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.width * 0.20,
              width: MediaQuery.of(context).size.width * 0.98,
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 60,
                    child: IconButton(
                      tooltip: "Bus Stop",
                      onPressed: () {},
                      icon: Image.asset(
                        "lib/icons/paypal.png",
                      ),
                    )),
                title: Text("Pay pal",
                    style: GoogleFonts.podkova(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFF2ECAF2),
                    Color(0XFFADFED4),
                    //Color(0XFFD4FFF3)
                  ]),
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.width * 0.20,
              width: MediaQuery.of(context).size.width * 0.98,
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 60,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "lib/icons/debit-card.png",
                      ),
                    )),
                title: Text("Card",
                    style: GoogleFonts.podkova(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFF2ECAF2),
                    Color(0XFFADFED4),
                    //Color(0XFFD4FFF3)
                  ]),
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.width * 0.20,
              width: MediaQuery.of(context).size.width * 0.98,
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 60,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "lib/icons/visa.png",
                      ),
                    )),
                title: Text("Debit card",
                    style: GoogleFonts.podkova(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFF2ECAF2),
                    Color(0XFFADFED4),
                    //Color(0XFFD4FFF3)
                  ]),
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.width * 0.20,
              width: MediaQuery.of(context).size.width * 0.98,
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 60,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "lib/icons/upi.png",
                      ),
                    )),
                title: Text("Upi",
                    style: GoogleFonts.podkova(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 100,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(children: [
            Container(
                alignment: Alignment.center,
                color: Color.fromARGB(255, 255, 255, 255),
                height: 40,
                width: 200,
                child: Text(
                  "Amount: $f_dist",
                  style: TextStyle(fontSize: 16),
                )),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment Successful')));
                  setState(() {
                    all_src.add(Source);
                    all_dst.add(destination);
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => page_controller(1),
                      ));
                },
                child: Text("Pay Now")),
          ]),
        ),
      ),
    );
  }
}
