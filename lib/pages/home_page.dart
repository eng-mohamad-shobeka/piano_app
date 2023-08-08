import 'package:beep_player/beep_player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget buildWhitePianoButton(BeepFile file) => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          child: MaterialButton(
            onPressed: () {
              BeepPlayer.play(file);
            },
            color: Colors.white,
          ),
        ),
      );

  Widget buildBlackPianoButton(BeepFile file, bool visible) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        child: SizedBox(
          height: 30,
          child: Visibility(
            visible: visible,
            child: MaterialButton(
              minWidth: 250,
              onPressed: () {
                BeepPlayer.play(file);
              },
              color: Colors.black,
            ),
          ),
        ),
      );

  /*Widget buildBlackPianoButton(BeepFile file) => Expanded(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            child: MaterialButton(
              minWidth: double.infinity,
              height: double.infinity,
              onPressed: () {
                BeepPlayer.play(file);
              },
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: -20,
            child: MaterialButton(
              onPressed: () {},
              color: Colors.black,
            ),
          ),
          Positioned(
            top: -20,
            child: MaterialButton(
              onPressed: () {},
              color: Colors.black,
            ),
          ),
        ]),
      );*/

  @override
  Widget build(BuildContext context) {
    //List<BeepFile> files = <BeepFile>[];
    List<Widget> whitePianoButtons = <Widget>[];
    List<Widget> blackPianoButtons = <Widget>[];
    for (int i = 0; i < 13; i++) {
      BeepFile file = BeepFile(
        'packages/package1/assets/note${(i % 7) + 1}.wav',
      );
      //files.add(file);
      BeepPlayer.load(file);

      whitePianoButtons.add(
        buildWhitePianoButton(
          file,
        ),
      );

      if (i == 12) {
        break;
      }
      blackPianoButtons.add(
        buildBlackPianoButton(
          file,
          !(i == 1 || i == 4 || i == 8 || i == 10),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: whitePianoButtons,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: blackPianoButtons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
