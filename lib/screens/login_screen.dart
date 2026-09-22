import 'package:flutter/material.dart';
import 'package:sprints_project/routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool hiddenContent = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 10, 84, 145),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Welcome back !",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 30),

                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null) {
                          return "you must fill this field";
                        }
                        if (!value.contains("@")) {
                          return "Email must contain '@'";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _passController,
                      validator: (value) {
                        if (value == null) {
                          return "you must fill this field";
                        }
                        if (value.length < 6) {
                          return "Password must be greater than 6 characters";
                        }
                        return null;
                      },
                      obscureText: hiddenContent,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hiddenContent = !hiddenContent;
                            });
                          },
                          icon: Icon(
                            hiddenContent
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return AlertDialog(
                                title: Text("Success"),
                                content: Text("Account login successfully"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(dialogContext);
                                      await _controller.forward();

                                      if (!mounted) return;

                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RouteName.homeRoute,
                                        (route) => false,
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 10, 84, 145),
                                      ),
                                    ),
                                    child: Text(
                                      "Close",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
