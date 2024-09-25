import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/routing_config/routes.dart';

class NotFoundPage extends StatefulWidget {
  final String address;

  const NotFoundPage(this.address, {super.key});

  @override
  NotFoundPageState createState() => NotFoundPageState();
}

class NotFoundPageState extends State<NotFoundPage> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "404 Not Found",
            textDirection: TextDirection.ltr,
          ),
          const SizedBox(height: 15),
          Text(
            "Address: ${widget.address}",
            textDirection: TextDirection.ltr,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.basePage);
            },
            child: const Text("Back to Home"),
          )
        ],
      )),
    );
  }
}
