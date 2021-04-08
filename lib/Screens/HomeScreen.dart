import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nextDate = '';
  final f = new DateFormat('yMMMMd');

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    var hijriToday = new HijriCalendar.now();
    int val = int.tryParse(nextDate) ?? 0;
    ///////////////////////////////////////
    var futureDay = today.add(Duration(days: val));
    var futureHijriDate = hijriToday.format(
        futureDay.year, futureDay.month, futureDay.day, 'MMMM dd yyyy');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'assets/main_top.png',
                  height: size.width * 0.3,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/login_bottom.png',
                  width: size.width * 0.4,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/clock.svg',
                    height: 120,
                  ),
                  Text(
                    'Please enter the future day',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          maxLines: 1,
                          maxLength: 8,
                          decoration: InputDecoration(
                            fillColor: Colors.purple[50],
                            filled: true,
                            hintText: 'Example: 14',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.deepPurple[50]),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                          ),
                          onChanged: (text) {
                            setState(() {
                              nextDate = text;
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'The date after $nextDate days will be:',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            color: Colors.purple[300],
                          ),
                        ),
                        Divider(
                          endIndent: 10,
                          indent: 0,
                          thickness: 1.5,
                        ),
                       nextDate == '' ? SizedBox() : Text(
                          '${f.format(futureDay)} (Gregorian - ميلادي)',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        nextDate == '' ? SizedBox() : Text(
                          '$futureHijriDate (Hijri - هجري)',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Text('Display the date after $nextDate days',),
                  //   style: ButtonStyle(
                  //     foregroundColor: MaterialStateProperty.all(Color(4284242864)),
                  //     backgroundColor: MaterialStateProperty.all(Colors.purple[50]),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
