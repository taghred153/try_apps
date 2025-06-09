import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_apps/providers/registerprovider.dart';
import 'package:try_apps/screens/loginscreen.dart';
import 'package:try_apps/widgets/registerwidget.dart';

class SignupScreen extends StatelessWidget {

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        leading: Icon(Icons.account_circle),
        actions: [
          Icon(Icons.add)
        ],
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterWidget(
                  controller: namecontroller,
                  labeltext: "Name",
                  icon: Icons.person,
              ),
              SizedBox(height: 10),
              RegisterWidget(
                controller: emailcontroller,
                labeltext: "Email",
                icon: Icons.email,
              ),
              SizedBox(height: 10),
              RegisterWidget(
                controller: phonecontroller,
                labeltext: "Phone",
                icon: Icons.phone,
              ),
              SizedBox(height: 10),
              RegisterWidget(
                controller: passwordcontroller,
                labeltext: "Password",
                icon: Icons.password,
                hidden: true,
              ),
              SizedBox(height: 20),
              Consumer<RegisterProvider>(
                builder: (context, value, child){
                  return ElevatedButton(
                      onPressed: () async{
                        if(formkey.currentState!.validate())
                          {
                            await value.signupprovider(
                                name: namecontroller.text,
                                email: emailcontroller.text,
                                phone: phonecontroller.text,
                                password: passwordcontroller.text,
                            );
                            if (value.registerModel != null && value.registerModel!.status == true)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            value.registerModel?.message ?? "Signup success")
                                    )
                                );
                              }
                            else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            value.registerModel?.message ?? "Signup failed")
                                    )
                                );
                              }
                          }
                      },
                      child: Text("Signup")
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("have an account?"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => LoginScreen())
                      );
                    },
                    child: const Text("Login"),
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
