import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sprints_project/routes/route_name.dart';
import 'package:sprints_project/widgets/change_lang.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin{
 final _formKey = GlobalKey<FormState>();
  bool hiddenContent = true;
  bool hiddenContent2 = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
        appBar: AppBar(title: Text(tr('sign_up')),
      actions: [
        ChangeLang()
      ],),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * .75,
              decoration: BoxDecoration(
              color: Color.fromARGB(255, 10, 84, 145),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("${tr('welcome')}!",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25),),
                    SizedBox(height: 30),
            
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr("empty_field");
                        } if (value.substring(0,1) != value.substring(0,1).toUpperCase()) {
                          return tr('name_val');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: tr('name'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr("empty_field");
                        }  if (!value.contains("@")) {
                          return tr('email_val');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: tr('email'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _passController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr("empty_field");
                        }  if (value.length < 6) {
                          return tr('pass_val');
                        }
                        return null;
                      },
                      obscureText: hiddenContent,
                      decoration: InputDecoration(
                        labelText: tr('pass'),
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
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: _confirmPassController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr("empty_field");
                        }  if (value != _passController.text) {
                          return tr('confirm_pass_val');
                        }
                        return null;
                      },
                      obscureText: hiddenContent2,
                      decoration: InputDecoration(
                        labelText: tr('confirm_pass'),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                            hiddenContent2 = !hiddenContent2;
                              
                            });
                          },
                          icon: Icon(
                            hiddenContent2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: () {
                        
                        if(_formKey.currentState!.validate()) {showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              title: Text(tr('success')),
                              content: Text(tr('sign_up_success')),
                              actions: [
                                ElevatedButton(
                                  onPressed: () async{
                                    Navigator.pop(dialogContext);
                                      await _controller.forward();

                                      if (!mounted) return;

                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      RouteName.homeRoute,
                                      (route)=> false
                                    );
                                  },
                                  style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 10, 84, 145))),
                                  child: Text(tr('close'),style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            );
                          },
                        );}
                      },
                      child: Text( tr('submit'),style: TextStyle(color: Colors.white)),
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