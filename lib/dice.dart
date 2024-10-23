import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'bacck.dart';
import 'login.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => DiceState();
}

class DiceState extends State<Dice> {

  AudioPlayer audio = AudioPlayer();
  Random random = Random();
  int diceval = 1, diceval1 = 1;
  int counter = 1, counter1 = 0;
  String dicestring = 'Roll the Dice';
  String dicecond = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text('Dice', textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 24, color: Colors.black87)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=> Get.to(() => const Settings(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 300)),
              icon: const Icon(LineAwesomeIcons.cog_solid ))],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              colors: [Color(0xCCE4E677),Color(0xCCFFE200)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //const SizedBox(height: 200),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                      onPressed: () async {
                        await DiceRoll();
                        },
                      child: Transform.rotate(
                        angle: random.nextDouble() * 180,
                          child: Image.asset('ass/img/dice_$diceval.png',
                              height: 100))),
                ),
                const SizedBox(width: 30, height:100),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                      onPressed: () async {
                        await DiceRoll();
                      },
                      child: Transform.rotate(
                          angle: random.nextDouble() * 180,
                          child: Image.asset('ass/img/dice_$diceval1.png',
                              height: 100))),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Color(0xCCE4E677),Color(0xCCFFE200)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            dicestring,
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 222,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              dicecond,
                              style: GoogleFonts.poppins(fontSize: 16),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
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

  Future<void> DiceRoll() async {
    await audio.setAsset('ass/img/rolling-dice.mp3');
    audio.play();
    Timer.periodic(const Duration(milliseconds: 80), (timer){
      counter++;
      counter1++;
      setState(() {
        diceval = 1 + random.nextInt(6);
        diceval1 = 1 + random.nextInt(6);
        print('Dice Value: $diceval & $diceval1');
        print('Counter Value: $counter');
        dicestring = 'Rolling ' + '.' * counter1;
        dicecond = '';
      });
      if (counter % 3 == 0){
        setState(() {
          counter1 = 0;
        });
      }
      if (counter >= 13){
        timer.cancel();
        setState(() {
          counter = 1;
          counter1 = 0;
          dicestring = 'You rolled a $diceval and a $diceval1';
        });
        if (diceval > diceval1) {
          setState(() {
            dicecond = 'You\'ve rolled a higher dice on the left';
          });
        } else if (diceval1 > diceval){
          setState(() {
            dicecond = 'You\'ve rolled a higher dice on the right';
          });
        } else {
          setState(() {
            dicecond = 'It\'s a double!';
          });
        }
      }
    });
  }
}