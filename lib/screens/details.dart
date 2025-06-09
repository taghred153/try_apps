import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget{
  final String title;
  final String first;
  final String last;
  final String email;
  final String phone;
  final String gender;
  final String urlphoto;

  DetailsScreen({
    super.key,
    required this.title,
    required this.first,
    required this.last,
    required this.email,
    required this.phone,
    required this.gender,
    required this.urlphoto,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(urlphoto),
            SizedBox(height: 10,),
            Text(title,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 10,),
            Text(first,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 10,),
            Text(last,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 10,),
            Text(email,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 10,),
            Text(phone,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 10,),
            Text(gender),
          ],
        ),
      ),
    );
  }
}