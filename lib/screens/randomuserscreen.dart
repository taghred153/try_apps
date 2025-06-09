import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_apps/providers/randomuserprovider.dart';
import 'package:try_apps/widgets/randomuserwidget.dart';

class RandomUserScreen extends StatelessWidget {
  const RandomUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RandomUser")),
      body: Center(
        child: Consumer<RandomUserProvider>(
          builder: (context, value, child){
            var user = value.randomUserModel;
            if(user == null)
              {
                value.fetchdata();
                return Center(child: CircularProgressIndicator());
              }
            else{
              return ListView.builder(
                  itemBuilder: (context, index){
                    var users = user.results[index];
                    return RandomUserWidget(
                        title: users["name"]["title"],
                        first: users["name"]["first"],
                        last: users["name"]["last"],
                        email: users["email"],
                        phone: users["phone"],
                        gender: users["gender"],
                        urlphoto: users["picture"]["thumbnail"]
                    );
                  },
                itemCount: user.results.length,
                  );
            }
          },
        ),
      ),
    );
  }
}
