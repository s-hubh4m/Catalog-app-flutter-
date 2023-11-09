// ignore_for_file: prefer_const_constructors, sort_child_properties_last, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String name=" ";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async{
    if (_formKey.currentState!.validate())
    setState(() {
                      changeButton=true;
                    });
                    await Future.delayed(
                      Duration(seconds: 3),
                    );
                    await Navigator.pushNamed(context, MyRoutes.homeRoute);
                    setState(() {
                      changeButton=false;
                    });

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_template.png",
               fit: BoxFit.cover),
               SizedBox(
                height: 20.0,
               ),
               Text("Welcome to CONNECT",
               style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 19, 24, 127),
               )
               ,),
               SizedBox(
                height: 20.0,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                 child: Column(
                  children: [
                    TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                  validator: (value){
                    if (value!.isEmpty) {
                      return "Username cannot be empty ";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name=value;
                    setState(() {
                      
                    });
                  },
               
                 ),
                 TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length<6){
                      return "Password cannot be less than 6 letters";
                    }
                    
                    return null;
                  },
                 ),
                 SizedBox(
                height: 40.0,
               ),
               Material(
                borderRadius: BorderRadius.circular(changeButton? 50:8),
                color: Color.fromARGB(255, 19, 24, 127),
                 child: InkWell(
                  onTap :() => moveToHome(context),
                   child: AnimatedContainer(
                    duration: Duration(seconds: 10),
                    width: 80,
                    height: 40,
                    alignment: Alignment.center,
                    child: changeButton
                    ?  Icon(
                      Icons.done
                      )
                    
                    
                    
                    : Text("Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                    
                    ),
                   ),
                 ),
               
               
              
                  ],
                 ),
               )
             
            ],
            
            
          ),
        ),
      ),
      );
  }
}