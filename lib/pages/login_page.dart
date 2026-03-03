import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/register_page.dart';
import 'package:food_delivery_app/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap; 
  const LoginPage({super.key, this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void login() async{
    final _authService = AuthService();

    if(passwordController.text.isEmpty || emailController.text.isEmpty){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text("Input fields required"),
        )
      );
      return;
    }
    try{
      await _authService.signInWithEmailPassword(emailController.text, passwordController.text);
    }
    catch(e){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lock_open_rounded,size: 100,color: Theme.of(context).colorScheme.inversePrimary,),
          SizedBox(height: 25),
          Text("Food delivery app", style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary )),
          SizedBox(height: 25),


          SizedBox(height: 25),
          MyTextField(
            controller: emailController, 
            hintText: "Your email Address", 
            obscureText: false
          ),
          SizedBox(height: 25),
          MyTextField(
            controller: passwordController, 
            hintText: "Password", 
            obscureText: true
          ),
          SizedBox(height: 25),
          MyButton(
            text: "Sign in", onTap: login
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
              SizedBox(width: 4),
              GestureDetector(
                child: Text("Register Now", style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold
                 ),
                ),
                onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()))},
              )
            ],
          )
        ],
      ),
    );
  }
}