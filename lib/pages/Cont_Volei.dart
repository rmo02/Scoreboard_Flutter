import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Volei extends StatefulWidget {
  const Volei({Key? key}) : super(key: key);

  @override
  State<Volei> createState() => _VoleiState();
}

class _VoleiState extends State<Volei> {
  int _counter1 = 0;
  int _counter2 = 0;

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _decrementCount1() {
    setState(() => _counter1--);
  }

  void _decrementCount2() {
    setState(() => _counter2--);
  }

  void _resetCount() {
    setState(() {
      _counter2 = 0;
      _counter1 = 0;
    });
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Scoreboard")),
        backgroundColor: Color(0xff403B91),
        elevation: 7,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            InkWell(
              onTap: (){
                _incrementCounter1();
              },
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.blue
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Center(child: Text('Time Azul', style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 52,
                      fontWeight: FontWeight.w500
                    ))
                      ,),
                    Center(
                      child: Text('$_counter1',style: GoogleFonts.roboto(
                        fontSize: 120,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                    BackButton(
                      color: Colors.white,
                      onPressed: (){
                        _decrementCount1();
                      },
                    )

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                _incrementCounter2();
              },
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.red
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Center(child: Text('Time vermelho', style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 52,
                        fontWeight: FontWeight.w500
                    ))
                      ,),
                    Center(
                      child: Text('$_counter2',style: GoogleFonts.roboto(
                          fontSize: 120,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                    BackButton(
                      color: Colors.white,
                      onPressed: (){
                        _decrementCount2();
                      },
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _resetCount();
        },
        child: Icon(Icons.settings_backup_restore, color: Colors.black),
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}
