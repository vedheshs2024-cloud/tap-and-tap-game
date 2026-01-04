import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height/2,
              width: double.infinity,
              child: Center(
                child: MaterialButton(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height/5,
                  minWidth: MediaQuery.of(context).size.height/5,
                  shape: CircleBorder(),
                  onPressed: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Gamepage()));
                  },
                  child: Text("Start"),
                ),
              ),
        ),
            Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height/2,
              width: double.infinity,
              child: Center(
                child: MaterialButton(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height/5,
                  minWidth: MediaQuery.of(context).size.height/5,
                  shape: CircleBorder(),
                  onPressed: () {
                   Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Gamepage()));
                  },
                  child: Text("Start"),
                ),
              ),
        ),
      ]),
      );
  }

}

class Gamepage extends StatefulWidget {
  const Gamepage({super.key});

  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  double redcardh = 0;
  double bluecardh = 0;
  bool start=false;
  int PlayerAscore = 0;
  int PlayerBscore = 0;
  String winner = "";
  @override
  Widget build(BuildContext context) {
    double cardheight = MediaQuery.of(context).size.height;
    if(!start){
      redcardh = MediaQuery.of(context).size.height/2;
      bluecardh = MediaQuery.of(context).size.height/2;
      start=true;
    }
    return Scaffold(
      body: 
        Column(
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  redcardh += cardheight/30;
                  bluecardh -= cardheight/30;
                  PlayerAscore += 1;
                });
                if(redcardh > cardheight-cardheight/20){
                  winner = "Player A";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => resultpage(Colors.red,winner,PlayerAscore)));
                }
              },
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.red,
                height: redcardh,
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Text("Player A", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text("Score: "+PlayerAscore.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    
                  ],
                ),
              ),
            ),
        
            MaterialButton(
              onPressed: () {
                setState(() {
                  bluecardh += cardheight/30;
                  redcardh -= cardheight/30;
                  PlayerBscore += 1;
                });
                if(bluecardh > cardheight-cardheight/20){
                  winner = "Player B";
                  Navigator.push(context, MaterialPageRoute(builder: (context) => resultpage(Colors.blue,winner,PlayerBscore)));
                }
              },
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.blue,
                height: bluecardh,
                width: double.infinity,
                alignment: Alignment.bottomLeft,
                
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Text("Player B", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text("Score: "+PlayerBscore.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
class resultpage extends StatelessWidget {
  String text;
  Color c;
  int point;
  resultpage(this.c,this.text,this.point);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text +" WON by", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
            Text("Points: "+point.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            MaterialButton(
              color: Colors.white,
              height: MediaQuery.of(context).size.height/15,
              minWidth: MediaQuery.of(context).size.width/3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Restart", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      backgroundColor: c,
    );
  }
}