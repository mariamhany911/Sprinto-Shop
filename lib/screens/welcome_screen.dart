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
                    Container(
                      width: 150,
                      height: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                        'https://m.media-amazon.com/images/I/711X0g9zd5L._AC_UF894,1000_QL80_.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        'lib/assets/Camera_Accessories.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.signUpRoute);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          const Color.fromARGB(255, 10, 84, 145),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.loginRoute);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
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
