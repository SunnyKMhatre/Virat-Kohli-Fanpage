import 'package:flutter/material.dart';
import 'package:vk_fanpage/common_widget/authentication.dart';
import 'package:vk_fanpage/common_widget/text_feild.dart';
import 'package:vk_fanpage/view/home.dart';
import 'package:vk_fanpage/view/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  bool isLoading = false;

  void despose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
    confirmpassController.dispose();
  }

  void signUpUsers() async {
    String res = await AuthServices().signUpUser(
        email: emailController.text,
        password: passController.text,
        confirmpass: confirmpassController.text);

    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }

    if (emailController != confirmpassController) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Password do not match")));
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.black],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextFieldInput(
                    controller: emailController,
                    hintText: "Enter Your Email",
                    icon: Icons.email_outlined,
                    maxLength: 60,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Your Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextFieldInput(
                    controller: passController,
                    hintText: "Enter Your Password",
                    icon: Icons.lock_outline_rounded,
                    maxLength: 8,
                    isObscure: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextFieldInput(
                    controller: confirmpassController,
                    hintText: "Confirm Password",
                    icon: Icons.lock_outline_rounded,
                    maxLength: 8,
                    isObscure: true,
                  ),
                  Text(
                    "Forgot password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: signUpUsers,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "Login!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
