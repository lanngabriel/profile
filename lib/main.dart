import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'bacck.dart';
import 'login.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Themes());
}

class Themes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(
              headlineSmall: GoogleFonts.poppins(
                color: Colors.black87,
              ),
              labelLarge: GoogleFonts.almendra(
                color: Colors.black54,
              ),
              displaySmall: const TextStyle(
                fontFamily: 'Akira Expanded',
                color: Colors.black87,
              ),
          ),
      ),
      themeMode: ThemeMode.light,
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: () => Get.to(() => const Bacck(), transition: Transition.fadeIn, duration: const Duration(seconds: 1)), icon: const Icon(LineAwesomeIcons.angle_left_solid)),
          title: Text('Profile', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
          centerTitle: true,
          actions: [
            IconButton(onPressed: ()=> Get.to(() => const Settings(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 300)), icon: const Icon(LineAwesomeIcons.cog_solid )),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [Color(0xCCE4E677),Color(0xCCFFE200)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(

              decoration: const BoxDecoration(
                //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                gradient: LinearGradient(colors: [Color(0xFFFFF530),Color(0xFFFFFFFF)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),

            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // const SizedBox(height: 80,),
                Stack(
                  children: [
                    SizedBox(
                      width: 120, height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage('ass/img/lann.png'))),
                    ),
                    Positioned(
                      bottom: 0, right: 0,
                      child: Container(
                          width: 35, height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.yellow),
                          child: const Icon(LineAwesomeIcons.android, size: 20.0, color: Colors.black87)),
                    )

                  ],
                ),
                const SizedBox(height: 10),
                Text('Lann', style: Theme.of(context).textTheme.displaySmall),
                Text('Easy Peasy, Lemon Squeezy', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: (){_launchUrl('https://www.messenger.com/t/100002556682407/');},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const StadiumBorder(),
                        ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xCCFFE200), Color(0xCCE4E677)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(maxWidth: 200, minHeight: 50),
                          child: const Text('Message',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),


                ProfileWidget(title: "Email", icon: LineAwesomeIcons.mail_bulk_solid, onPress: (){_launchUrl('https://mail.google.com/mail/u/0/#inbox?compose=GTvVlcSHwfXTzlzHDgfTlPjQXlCspncrpgsXRdMxnmzNkwJfVsVmrRhLcLcTzBZXKjFBdFfpQTPsq');},),
                ProfileWidget(title: "Facebook", icon: LineAwesomeIcons.facebook, onPress: (){ _launchUrl('https://www.facebook.com/lann.gabriel');},),
                ProfileWidget(title: "Instagram", icon: LineAwesomeIcons.instagram, onPress: (){_launchUrl('https://www.instagram.com/lanngabriel');},),
                ProfileWidget(title: "Discord", icon: LineAwesomeIcons.discord, onPress: (){_launchUrl('https://discord.com/users/561902985203154944');},),
                ProfileWidget(title: "MAL", icon: LineAwesomeIcons.tv_solid, onPress: (){_launchUrl('https://myanimelist.net/profile/lanngabriel');},),
                const Divider(),
                const SizedBox(height:10),
                ProfileWidget(title: "Information", icon: LineAwesomeIcons.info_solid, onPress: (){_launchUrl('https://www.youtube.com/watch?v=xvFZjo5PgG0');},),
                ProfileWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.sign_out_alt_solid,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: ()=> Get.to(() => LogIn(), transition: Transition.fade, duration: const Duration(milliseconds: 1000)),
                ),

                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                        TextSpan(
                          text: 'Made by',
                          style: TextStyle(fontSize: 12),
                          children: [
                            TextSpan(text: ' Lann Gabriel', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                          ],
                        ),
                    ),
                    ElevatedButton(
                        onPressed: () {showDialog(
                            context: context, 
                            builder: (context) => AlertDialog(
                              actions: [
                                TextButton(onPressed: (){SystemNavigator.pop();},
                                  child: Text('Close',
                                      style: Theme.of(context).textTheme.bodyMedium),
                                ),
                              ],
                                  title: const Text('Confirm Exit'),
                                  contentPadding: const EdgeInsets.all(20),
                                  content: const Text('Are you sure you want to exit?'),
                                ),
                          );
                          },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black12.withOpacity(0.1),
                            elevation: 0,
                            foregroundColor: Colors.black45,
                            shape: const StadiumBorder(),
                            side: BorderSide.none
                        ),
                        child: const Text('Exit')
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40, height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black12.withOpacity(0.1)),
        child: Icon(icon, color: Colors.black54),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon? Container(
        width: 30, height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1)),
        child: const Icon(LineAwesomeIcons.angle_right_solid, size: 18.0, color: Colors.grey)) : null,
    );
  }
}

void _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}