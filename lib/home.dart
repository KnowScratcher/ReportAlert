import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:report_alert/components/button.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().disconnect();
  }

  @override
  Widget build(BuildContext context) {
    if (RegExp("s[0-9][0-9][0-9][0-9][0-9][0-9]@student[.]cysh[.]cy[.]edu[.]tw")
        .hasMatch(user.email!)) {
      return Scaffold(
        appBar: AppBar(
          title: Text(user.email!),
          actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                ColoredBox(
                  color: Colors.green,
                  child: Builder(builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "無警報",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const Expanded(
                    child: Divider(
                  thickness: 5,
                )),
                Button(
                  text: "發出警告",
                  onTap: () => {},
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(user.email!),
          actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))],
        ),
        body: SafeArea(
          child: Center(
            child: Text(
              "你無法使用這個帳號存取本服務",
              style: TextStyle(
                fontSize: 20,
                color: Colors.red[300],
              ),
            ),
          ),
        ),
      );
    }
  }
}
