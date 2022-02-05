// ignore: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homest/model/user_model.dart';
import 'package:homest/screens/home_screen.dart';

import 'login_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}
class _MainDrawerState extends State<MainDrawer> {
  // const MainDrawer({Key key}) : super(key: key);
  bool option = false;
   User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))],
              // ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                  "assests/worker.png",
                ),
              ),
              Divider(
                height: 9,
                thickness: 2.5,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text("${loggedInUser.firstName}${loggedInUser.secondName}",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "${loggedInUser.email}",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 1.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        // selected: option,
        // selectedTileColor: Colors.teal.shade100,
        onTap: () {
          setState(() {
            
          });
        },
        leading: const Icon(
          Icons.person_add_alt_1_outlined,
          color: Colors.black,
        ),
        title: const Text("Personal Information"),
      ),
      ListTile(
        // selected: option,
        onTap: () {
          setState(() {
            
          });
        },
        leading: const Icon(
          Icons.account_balance_wallet_outlined,
          color: Colors.black,
        ),
        title: const Text("Payments and payouts"),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.translate_outlined,
          color: Colors.black,
        ),
        title: const Text("Translation"),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.add_alert_outlined,
          color: Colors.black,
        ),
        title: const Text("Notifications"),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.offline_bolt_outlined,
          color: Colors.black,
        ),
        title: const Text("Offer Zone"),
      ),

      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.inbox,
          color: Colors.black,
        ),
        title: const Text("Your Inbox"),
      ),

      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.assessment,
          color: Colors.black,
        ),
        title: const Text("Your Dashboard"),
      ),
      Divider(
        height: 5,
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.home_filled,
          color: Colors.black,
        ),
        title: const Text("Host your house"),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.settings,
          color: Colors.black,
        ),
        title: const Text("Settings"),
      ),
      ListTile(
        // tileColor: Colors.red.shade300,
        focusColor: Colors.red,
        onTap: () {
          logout(context);
        },
        leading: const Icon(
          Icons.login_outlined,
          color: Colors.black,
        ),
        title: const Text("Log out"),
      ),
    ]);
    
  }
   Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
