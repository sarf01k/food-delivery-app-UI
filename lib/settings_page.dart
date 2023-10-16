import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700
                )
              ),
              SizedBox(height: 30),
              settingsTile('assets/icons/cc.png', 'Payment'),
              SizedBox(height: 20),
              settingsTile('assets/icons/tag.png', 'Promo codes'),
              SizedBox(height: 20),
              settingsTile('assets/icons/about.png', 'About'),
              SizedBox(height: 20),
              settingsTile('assets/icons/message_question.png', 'Help')
            ],
          ),
        )
      )
    );
  }

  settingsTile(String img, String text) {
    return Row(
      children: [
        Image.asset(img),
        SizedBox(width: 15),
        Text(text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300
          )
        )
      ],
    );
  }
}