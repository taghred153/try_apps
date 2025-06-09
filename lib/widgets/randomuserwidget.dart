import 'package:flutter/material.dart';
import 'package:try_apps/screens/details.dart';

class RandomUserWidget extends StatelessWidget {
  final String title;
  final String first;
  final String last;
  final String email;
  final String phone;
  final String gender;
  final String urlphoto;
  const RandomUserWidget({
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
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsScreen(title: title, first: first, last: last, email: email, phone: phone, gender: gender, urlphoto: urlphoto))
        );
      },
      child: Card(
        shadowColor: Colors.black,
      elevation: 10,
      child: Row(
        children: [
          CircleAvatar(
              child: Image.network (urlphoto, width: 10, height: 10,),
              radius: 100
          ),
          SizedBox(width: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 15,),
              Text(first),
              SizedBox(width: 15,),
              Text(last),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
