import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rapid/search_page.dart';
import 'controller/page_controller.dart';
import 'otherpages/payment.dart';

int _selectedIndex = 0;

class trips extends StatefulWidget {
  const trips({Key? key}) : super(key: key);

  @override
  State<trips> createState() => _tripsState();
}

class _tripsState extends State<trips> {
  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 128, 243),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Trips',
            style: GoogleFonts.pacifico(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0XFF2ECAF2), Color(0XFFADFED4)]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  padding: new EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 110, 157, 233),
                    elevation: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: IconButton(
                            icon: Icon(Icons.qr_code),
                            onPressed: (() {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Center(child: Text('QR CODE')),
                                  content: Container(
                                    alignment: Alignment.center,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    height: 150,
                                    width: 150,
                                    child: QrImage(
                                      data: all_src[
                                              all_src.length - index - 1] +
                                          " - " +
                                          all_dst[all_dst.length - index - 1],
                                      size: 150,
                                    ),
                                  ),

                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  // actions: <Widget>[
                                  //   TextButton(
                                  //     onPressed: () =>
                                  //         Navigator.pop(context, 'Cancel'),
                                  //     child: const Text('Cancel'),
                                  //   ),
                                  //   TextButton(
                                  //     onPressed: () =>
                                  //         Navigator.pop(context, 'OK'),
                                  //     child: const Text('OK'),
                                  //   ),
                                  // ],
                                ),
                              );
                            }),
                          ),
                          title: Text(
                            all_src[all_dst.length - index - 1],
                            style: GoogleFonts.podkova(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                          ),
                          subtitle: Text(
                            all_dst[all_dst.length - index - 1],
                            style: GoogleFonts.podkova(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: all_dst.length,
      ),
    );
  }
}
