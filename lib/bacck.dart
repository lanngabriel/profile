import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const Bacck());
}

class Bacck extends StatelessWidget {
  const Bacck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left_solid)),
          title: Text('Back', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
          centerTitle: true,
        ),
        body: const Center(
          child: Image(image: AssetImage('ass/img/deez-nutz-deez-nuts.gif')),
        ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text('Settings', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: const Center(
        child: Image(image: AssetImage('ass/img/Builder.gif')),
      ),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text('You Are Logged Out', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {SystemNavigator.pop();},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.1),
                elevation: 0,
                foregroundColor: Colors.black45,
                shape: const StadiumBorder(),
                side: BorderSide.none
            ),
            child: const Text('Exit')
        ),
      )


    );
  }
}