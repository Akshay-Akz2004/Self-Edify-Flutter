import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class StudyOS extends StatelessWidget {
  const StudyOS({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: NetworkImage(
                  "https://img.freepik.com/premium-vector/illustration-concept-equipment-world-school-education_999616-1177.jpg?w=900"),
            ),
            const SizedBox(height: 2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Video lectures",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            CarouselWithVideos(),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Notes",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ModuleCards(),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

class ModuleCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ModuleCard(
          name: "Module 1: Introduction to OS",
          url: "https://drive.google.com/file/d/1PmPyzCJhPqRCSkASPJbheyRQdB8CXkM7/view",
        ),
        ModuleCard(
          name: "Module 2: Process Scheduling",
          url: "https://drive.google.com/file/d/18OzehVgtXaBj56F5LdfuypZqAETcHdZb/view",
        ),
        ModuleCard(
          name: "Module 3: Process Synchronization",
          url: "https://drive.google.com/file/d/10xtpbN0kRUzmVWnqE_uWvc2mRup3mDJg/view",
        ),
        ModuleCard(
          name: "Module 4: Memory Management",
          url: "https://drive.google.com/file/d/1nQ4sigaJOsUBEVVm22rJ-9fVFKEubcG_/view",
        ),
        ModuleCard(
          name: "Module 5: File Systems",
          url: "https://drive.google.com/file/d/1PxJmSonR9KFVVXzoIgyWpfblF6tblL7p/view",
        ),
      ],
    );
  }
}

class ModuleCard extends StatelessWidget {
  final String name;
  final String url;

  const ModuleCard({required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(url);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListTile(
          title: Text(name),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CarouselWithVideos extends StatelessWidget {
  final List<String> videoUrls = [
    "https://youtu.be/8XBtAjKwCm4?si=iSNJdV8snZP1lnIF",
    "https://www.youtube.com/live/AG2v4U-mFAI?si=xP3qUMcS8Ns-X6Qh",
    "https://youtu.be/xw_OuOhjauw?si=Q43B7ki1Dojex4uN"
  ];

  final List<String> thumbnails = [
    "https://img.youtube.com/vi/8XBtAjKwCm4/maxresdefault.jpg",
    "https://img.youtube.com/vi/AG2v4U-mFAI/maxresdefault.jpg",
    "https://img.youtube.com/vi/xw_OuOhjauw/maxresdefault.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: thumbnails.length,
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return InkWell(
          onTap: () {
            _launchURL(videoUrls[index]);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              thumbnails[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
