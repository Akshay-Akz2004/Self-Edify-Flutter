import 'package:flutter/material.dart';
import 'package:self_edify/pages/PYQs.dart';
import 'package:self_edify/pages/chatbot.dart';
import 'package:self_edify/pages/studymaterialOS.dart';
import 'package:url_launcher/url_launcher.dart';

class OperatingSystem extends StatelessWidget {
  const OperatingSystem({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Text(
                'Operating Systems',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 20),
              Image(image: NetworkImage('https://img.freepik.com/free-vector/computer-technician-with-wrench-repairing-computer-screen-with-gears-computer-service-laptop-repair-center-notebook-setup-service-concept-bright-vibrant-violet-isolated-illustration_335657-952.jpg?w=996&t=st=1712510914~exp=1712511514~hmac=f0f7745ac627db0e99167c7a3ab28a99fc151fa6c2f8c009fd3b41f25917abd3')),
              SizedBox(height: 20,),
              CardItem(
                title: 'Study Materials',
                subtitle: 'Based on latest 2019 scheme',
                imageUrl:
                    'https://img.freepik.com/free-psd/school-elements-composition_23-2150572915.jpg?w=740',
                navigateTo: StudyOS(), // Navigate to StudyMaterials page
              ),
              CardItem(
                title: 'View syllabus',
                subtitle: 'Latest syllabus based on KTU',
                imageUrl:
                    'https://img.freepik.com/premium-vector/loading-process-computer-screen-system-software-update-data-upgrade-synchronize-with-progres_435184-960.jpg?w=996',
                linkUrl: 'https://drive.google.com/file/d/1OlVHtCAfyOcfXQPs_0i0wmM9FRrl60Ao/view', // Add the provided link URL
              ),
              CardItem(
                title: 'PYQs',
                subtitle: 'Previous year question papers',
                imageUrl:
                    'https://psczone.in/wp-content/uploads/2020/02/KTU-1024x512.jpg',
                navigateTo: PreviousYear(), // Navigate to PYQs page
              ),
              CardItem(
                title: 'Ask a doubt!',
                subtitle: 'AI powered doubt solver',
                imageUrl:
                      'https://img.freepik.com/free-vector/flat-thinking-concept_23-2148156507.jpg?w=740',
                navigateTo: ChatBot(), // Navigate to PYQs page
              ),
              const SizedBox(height: 50,)
              
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Widget? navigateTo; // Added navigateTo parameter for navigation
  final String? linkUrl;

  const CardItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.navigateTo, // Added navigateTo parameter for navigation
    this.linkUrl, // Make linkUrl nullable to indicate it's optional
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: GestureDetector(
        onTap: () {
          if (linkUrl != null) {
            _launchURL(linkUrl!); // Launch the provided link if it's not null
          } else if (navigateTo != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => navigateTo!), // Navigate to the specified page
            );
          }
        },
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
        ),
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
