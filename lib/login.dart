import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';


class LogIn extends StatefulWidget {
  @override
  LogInState createState() => LogInState();
}

class LogInState extends State<LogIn> {
  bool TextVisibility = true;

  void PasswordVisibility() {
    setState(() {
      TextVisibility = !TextVisibility;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(

            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFFFFF530),Color(0xFFFFFFFF)],
                end: Alignment.center,
                begin: Alignment.bottomCenter,
              ),
            ),

            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Image(image: AssetImage('ass/img/deez-nutz-deez-nuts.gif')),
                const Text('Login',style: TextStyle(
                  fontFamily: 'Akira Expanded',
                  fontSize: 30.0,
                  color: Colors.black87)),
                const SizedBox(height: 5.0,),
                Text.rich(
                  TextSpan(text: 'Don\'t have an account?  ', style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(text: 'Sign up',style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black45),
                    recognizer: TapGestureRecognizer()
                    ..onTap = () {showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(onPressed: (){Navigator.of(context).pop();},
                            child: Text('Close',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ],
                        title: const Text('Sign Up'),
                        contentPadding: const EdgeInsets.all(20),
                        content: const Text('Login Page isn\'t even done bro'),
                      ),
                    );
                    }),
                  ]),
                ),
                Form(child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_2_outlined),
                          labelText: 'Username',
                          labelStyle: const TextStyle(color: Colors.black54),
                          hintText: 'Username',
                          hintStyle: const TextStyle(color: Colors.black38, fontWeight: FontWeight.w300, fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xCCFFE200), width: 2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        obscureText: TextVisibility,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.fingerprint_outlined),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.black38, fontWeight: FontWeight.w300, fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xCCFFE200), width: 2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          suffixIcon: IconButton(icon: Icon(
                              TextVisibility? CupertinoIcons.eye_slash : CupertinoIcons.eye), onPressed: (){PasswordVisibility();}),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Align(alignment: Alignment.topRight,
                          child: Text.rich(
                            TextSpan(text: 'Forgot Password?    ',style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      //decoration: TextDecoration.underline,
                                      //decorationColor: Colors.black45
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(onPressed: (){Navigator.of(context).pop();},
                                                child: Text('Close',
                                                    style: Theme.of(context).textTheme.bodyMedium),
                                              ),
                                            ],
                                            title: const Text('Forgot Password?'),
                                            contentPadding: const EdgeInsets.all(20),
                                            content: const Text('Login Page isn\'t even done bro'),
                                          ),
                                        );
                                        }
                                        ),
                          ),
                      ),
                      const SizedBox(height: 30,),
                      Center(
                        child: SizedBox(
                          //width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: const StadiumBorder(),
                                side: BorderSide.none
                            ),
                            onPressed: (){}, child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xCCFFE200), Color(0xCCE4E677)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,),
                               borderRadius: BorderRadius.circular(30),),
                              child: Container(
                                alignment: Alignment.center,
                                constraints: const BoxConstraints(maxWidth: 200, minHeight: 50),
                                child: const Text('Log In',
                                  style: TextStyle(color: Colors.black87),
                                ),
                             ),
                          ),
                        ),
                        ),
                      ),
                      const SizedBox(height: 300,),
                    ],
                  ),
                ),
                ),

              ],
            ),
          )
        ),
      ),
    );
  }
}