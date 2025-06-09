import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_apps/providers/registerprovider.dart';
import 'package:try_apps/screens/randomuserscreen.dart';
import 'package:try_apps/screens/signupscreen.dart';
import 'package:try_apps/widgets/registerwidget.dart';

class LoginScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(
        child: Text("Login", style: TextStyle(fontSize: 24)),
      ),
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 95,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/002/737/799/large_2x/online-registration-illustration-concept-free-vector.jpg"),
                ),
              ),
              const SizedBox(height: 40),
              RegisterWidget(
                  controller: emailcontroller,
                  labeltext: "email",
                  icon: Icons.email,
              ),
              const SizedBox(height: 10),
              RegisterWidget(
                controller: passwordcontroller,
                labeltext: "password",
                icon: Icons.password,
                hidden: true,
              ),
              const SizedBox(height: 20),
              Consumer<RegisterProvider>(
                  builder: (context, value, child){
                    return ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            await value.loginprovider(
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                            );

                            if (value.registerModel != null && value.registerModel!.status == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RandomUserScreen()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(value.registerModel?.message ?? "Login success")),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(value.registerModel?.message ?? "Login failed")),
                              );
                            }
                          }
                        },

                        child: Text("Login")
                    );
                  },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SignupScreen())
                      );
                    },
                    child: const Text("Signup"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
