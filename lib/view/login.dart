import 'package:flutter/material.dart';
import 'package:vk_fanpage/common_widget/authentication.dart';
import 'package:vk_fanpage/common_widget/text_feild.dart';
import 'package:vk_fanpage/view/home.dart';
import 'package:vk_fanpage/view/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isLoading = false;

  void despose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  void loginUsers() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passController.text,
    );

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
              padding: const EdgeInsets.all(16.0),
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
                      onPressed: loginUsers,
                      child: Text(
                        "Login",
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
                        "Don't have an account? ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
