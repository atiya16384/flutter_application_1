// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/square_signature.dart';
import 'package:flutter_application_1/pages/pages_initial/reset_password_page.dart';

import '../../components/button.dart';
import '../../components/text_field.dart';

//changes its properties during run time
//widget is dynamic
//different parts of the login page will change state depending on what action has been taken
class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// Messages for the possible authentication errors
  void wrongEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Wrong Email"));
        });
  }

  void wrongPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Wrong password"));
        });
  }

  void invalidEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Invalid Email"));
        });
  }

  void invalidPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Invalid Password"));
        });
  }

  // sign user in method
  void signUserIn() async {
    // show loading circle

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(228, 92, 162, 100),
              strokeWidth: 3,
            ),
          );
        });

    //put this in a try and exception to eradicate possible user errors
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pop(context);
      // ignore: curly_braces_in_flow_control_structures
    } on FirebaseAuthException catch (e) {
      //WRONG EMAIL
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print("No user is found");
        wrongEmail();

        //WRONG PASSWORD
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print("user has printed wrong password");
        wrongPassword();

        //INVALID EMAIL
      } else if (e.code == "invalid-email") {
        // ignore: avoid_print
        print("The username provided is not valid");
        invalidEmail();

        //INVALID PASSWORD
      } else if (e.code == "invalid-password") {
        // ignore: avoid_print
        print("The password provided is not valid");
        invalidPassword();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // child: Center(
        //wrap this in singlechildscrollview
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              //add image here

              // const SquareTile(imagePath: 'lib/images/Menopause_Unzipped.png'),

              const SizedBox(height: 140),

              // welcome back, you've been missed!
              const Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email-Address',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 5),

              // forgot password?
              //implement authentication for forgot password
              // GestureDetector(
              //   onTap: widget.onTap,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: const [
              //         Text(
              //           'Forgot Password?',
              //           style: TextStyle(color: Colors.black),

              //           //when this button is pressed
              //           // we go to the reset_password_page
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      child: const Text('Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const resetPasswordPage())))
                ],
              ),

              const SizedBox(height: 10),

              // sign in button
              //need to provide positional argument

              Button(onTap: signUserIn, label: 'Sign In'),

              const SizedBox(height: 20),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Sign up here',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const signatureSquareTile(imagePath: 'lib/images/Signature.png'),
            ],
          ),
        ),
      ),
    );
    //  );
  }
}
