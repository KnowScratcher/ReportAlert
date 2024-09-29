import 'package:flutter/material.dart';
import 'package:report_alert/components/squareTiles.dart';
import 'package:report_alert/constant.dart';
import 'package:report_alert/services/auth_service.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.notifications_active,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                "歡迎來到The警報系統",
                style: TextStyle(
                  color: Constant.textColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 5)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "你只能這樣登入",
                      style: TextStyle(
                        color: Constant.textColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 5)),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTiles(
                    onTap: () => AuthService().signinWithGoogle(),
                    imagePath: "assets/google.png",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
