import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:self_edify/pages/operatingsystem.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  // List of URLs corresponding to each image
  final List<String> imageUrls = [
    'https://tse3.mm.bing.net/th?id=OVP.PoJwbdrc54XDVLE5vqs7aAEsDh&pid=Api&h=225&w=300&c=7&rs=1',
    'https://tse2.mm.bing.net/th?id=OVP.saCb6CtdgKoKQ6o1M5tjTwEsDh&pid=Api&h=225&w=300&c=7&rs=1',
    'https://tse3.mm.bing.net/th?id=OVP.xpw47LW0ycB2LWkrcchMBQEsDh&pid=Api&h=225&w=300&c=7&rs=1',
  ];

  // List of URLs corresponding to each image link
  final List<String> imageLinks = [
    'https://youtu.be/a1l4MceYHaQ',
    'https://youtu.be/3EJlovevfcA',
    'https://youtu.be/Ol8D69VKX2k',
  ];

  // Sample available courses
  final List<String> courses = [
    'Operating Systems',
    'Computer Organization',
    'Graph Theory',
    'Database Management Systems',
    'Constitution Of India',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Your journey to mastery starts here!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.search),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Implement your search logic here
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Trending",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: imageUrls.map((item) {
                  int index = imageUrls.indexOf(item);
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          _launchURL(imageLinks[index]);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(item),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Available Courses',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              SizedBox(
                height: 400, // Adjust height according to your design
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector( // Wrap with GestureDetector for navigation
                      onTap: () {
                        if (courses[index] == 'Operating Systems') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OperatingSystem()),
                          );
                        }
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ListTile(
                          title: Text(
                            courses[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Learn now!',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50,)
            ],
          ),
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
