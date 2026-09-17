import 'package:flutter/material.dart';
import 'package:sprints_project/routes/route_name.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sprinto shop")),
      body: Column(
        children: [
          SizedBox(height: 80),
          Text(
            "Welcome to our \n Camera shop",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.network(
                        'https://m.media-amazon.com/images/I/711X0g9zd5L._AC_UF894,1000_QL80_.jpg',
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset('lib/assets/Camera_Accessories.jpg'),
                    ),
                  ],
                ),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.signUpRoute);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 10, 84, 145))
                      ),
                      child: Text("Sign Up",style: TextStyle(color: Colors.white),),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.loginRoute);
                      },
                      child: Text("Login",style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
