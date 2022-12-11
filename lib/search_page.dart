import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid/trips.dart';
import 'otherpages/payment.dart';
//import 'package:rapid/utils/consts.dart';
import 'otherpages/stations.dart';

void main() {
  runApp(search_page());
}

String Source = "Select Source";
String destination = "Select Destination";
bool selected_source = false;

class search_page extends StatefulWidget {
  const search_page({Key? key}) : super(key: key);

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 118, 128, 243),
          title: Text("Search",
              style: GoogleFonts.pacifico(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ))),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.172),
            child: Container(
              color: Color(0xFFFFFFFF),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0XFF2ECAF2),
                              Color(0XFFADFED4),
                              //Color(0XFFD4FFF3)
                            ]),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.transparent,
                              shadowColor: Colors.transparent,
                              //make color or elevated button transparent
                            ),
                            onPressed: () {
                              setState(() {
                                if (Source == list[index]) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.blue,
                                          content: Text(
                                              'Choose appropriate destination!',
                                              style: GoogleFonts.podkova(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1,
                                              ))));
                                } else {
                                  selected_source
                                      ? destination = list[index]
                                      : Source = list[index];
                                  selected_source = true;
                                }
                              });
                            },
                            child: ListTile(
                              leading: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //color: Color.fromARGB(255, 118, 128, 243),
                                  ),
                                  height: 40,
                                  child: IconButton(
                                    tooltip: "Bus Stop",
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "lib/icons/bus-stop (2).png",
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  )),
                              title: Text(list[index],
                                  style: GoogleFonts.podkova(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                            ),
                          ),
                        )),
                  );
                },
                itemCount: list.length,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 110, 157, 233),
                //color: Color.fromARGB(255, 110, 157, 233),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            child: Container(
              // color: Colors.amber,
              width: MediaQuery.of(context).size.width * .85,
              height: 30,
              alignment: Alignment.center,
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("From: ",
                      style: GoogleFonts.pacifico(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          fontSize: 25,
                          color: Colors.white)),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("$Source",
                          style: GoogleFonts.podkova(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                              fontSize: 18,
                              color: Colors.white)),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("To: ",
                      style: GoogleFonts.pacifico(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          fontSize: 25,
                          color: Colors.white)),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("$destination",
                          style: GoogleFonts.podkova(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                              fontSize: 18,
                              color: Colors.white)),
                    ),
                  ),
                ]),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 118, 128, 243),
                          ),
                          height: 40,
                          child: IconButton(
                            tooltip: "Clear",
                            onPressed: () {
                              setState(() {
                                Source = "Select Source";
                                destination = "Select Destination";
                                selected_source = false;
                              });
                            },
                            icon: Image.asset(
                              "lib/icons/eraser.png",
                              color: Colors.white,
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 118, 128, 243),
                          ),
                          height: 40,
                          child: IconButton(
                            tooltip: "Go for Payment",
                            onPressed: () {
                              if (destination == "Select Destination") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.blue,
                                        content:
                                            Text('Please select destination!',
                                                style: GoogleFonts.podkova(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 1,
                                                ))));
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => payment(),
                                  ),
                                );
                              }
                            },
                            icon: Image.asset(
                              "lib/icons/go.png",
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
