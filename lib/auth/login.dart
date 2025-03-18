import 'package:education_app/auth/signup.dart';
import 'package:education_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        Get.to(() => HomeScreen());
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Enter Valid Cridentials")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 125,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Icon(
                        Icons.login_rounded,
                        size: 100,
                      )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              //welcome text
              const Text(
                "Welcome back! You have been Missed",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Fill Up the Username Field";
                      }
                      final emailRegex =
                          RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+$');
                      if (!emailRegex.hasMatch(value)) {
                        return "Enter Vaild Email";
                      } else {
                        return null;
                      }
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[50]!)),
                        hintText: "Username",
                        hintStyle: const TextStyle(color: Colors.grey)),
                  )),
              const SizedBox(
                height: 20,
              ),

              //textfeild for password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the Password";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[50]!)),
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.grey)),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              //forgetpassword

              //signup button
              const SizedBox(
                height: 25,
              ),
              _isLoading
                  ? const CircularProgressIndicator()
                  : InkWell(
                      onTap: () {
                        _login();
                      },
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: const Color(0xFF674AEF),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              //Continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    )),
                    Text(
                      "Or Register Yourself",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(const SignupScreen());
                },
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
