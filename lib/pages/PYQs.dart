import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviousYear extends StatelessWidget {
  const PreviousYear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Image(
            image: NetworkImage(
                "https://img.freepik.com/free-vector/hand-drawn-no-data-illustration_23-2150696461.jpg?w=740&t=st=1712580748~exp=1712581348~hmac=fc61b402f6db119fc0855950f7962b1857c504bb904248b3a4d4e00203b90a78"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "PYQs based on 2019 KTU scheme",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 4,
              child: ListTile(
                title: const Text("2021"),
                onTap: () {
                  _launchURL(
                      'https://drive.google.com/file/d/1J34ceNWpTD_ZOHdvtKn1_5ZNaZFOu3_x/view'); // Replace 'https://example.com/2021' with the desired link for 2021
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 4,
              child: ListTile(
                title: const Text("2022"),
                onTap: () {
                  _launchURL(
                      'https://drive.google.com/file/d/1mHdIgVrKn7aVF2iA2F6lI2W1c45d1Lk-/view'); // Replace 'https://example.com/2022' with the desired link for 2022
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
