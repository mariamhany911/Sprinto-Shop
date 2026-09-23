import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLang extends StatefulWidget {
  const ChangeLang({super.key});

  @override
  State<ChangeLang> createState() => _ChangeLangState();
}

class _ChangeLangState extends State<ChangeLang> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(context.locale == Locale('en', 'US') ? "AR" : "EN"),
        IconButton(
          onPressed: () {
            setState(() {
              context.locale == Locale('en', 'US')
                  ? context.setLocale(Locale('ar', 'EG'))
                  : context.setLocale(Locale('en', 'US'));
            });
          },
          icon: Icon(Icons.language),
        ),
      ],
    );
  }
}
