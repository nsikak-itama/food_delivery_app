import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/login_page.dart';
import 'package:food_delivery_app/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key,  this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void register() async{
    final _authService = AuthService();
    if (passwordController.text != confirmPasswordController.text) {
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Passwords do not match"),
      ),
    );
    return;
  }
    try{
      await _authService.signUpWithEmailPassword(emailController.text, passwordController.text);
    }
    catch (e){
      showDialog(
        // ignore: use_build_context_synchronously
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
           MyTextField(
            controller: nameController, 
            hintText: "Your full name", 
            obscureText: false
          ),
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
          MyTextField(
            controller: confirmPasswordController, 
            hintText: "Confirm Password", 
            obscureText: true
          ),

          SizedBox(height: 25),
          MyButton(
            text: "Sign Up", 
            onTap: register
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already a member?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
              SizedBox(width: 4),
              GestureDetector(
                child: Text("Sign In", style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold
                 ),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
              )
            ],
          )
        ],
      ),
    );
  }
}