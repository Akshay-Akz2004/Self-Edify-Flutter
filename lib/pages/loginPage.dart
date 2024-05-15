import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:self_edify/pages/signin.dart';
import 'package:self_edify/pages/signup.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            CarouselSlider(
              options: CarouselOptions(
                height: 500.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                // First image and subheading
                Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Image.network(
                            'https://img.freepik.com/free-vector/learning-concept-illustration_114360-6186.jpg?w=740&t=st=1712487295~exp=1712487895~hmac=d2f33ccca97dea6bc9c4ec2fa43e9ee27af086e9e26247159810390b655f1e17'),
                        const Text("Learn From Anywhere",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      ],
                    );
                  },
                ),
                // Second image and subheading
                Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Image.network(
                            'https://img.freepik.com/free-vector/time-management-concept-man-working_23-2148821987.jpg?w=740'), // Replace 'https://example.com/second_image.jpg' with your second image URL
                        const Text("Make Schedules Perfect",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      ],
                    );
                  },
                ),
                // Third image and subheading
                Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Image.network(
                            'https://img.freepik.com/free-vector/online-certification-concept_23-2148575655.jpg?w=740'), // Replace 'https://example.com/third_image.jpg' with your third image URL
                        const Text("Start Learning New Skills",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      ],
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 15,),
            SizedBox(
              width: double.infinity, // Make the button width stretch to fit screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded edges
                    ),
                    backgroundColor: Colors.green, // Green background color
                  ),
                  child: const Text('Sign In', style: TextStyle(color: Colors.white)), // White text color
                ),
              ),
            ),
            const SizedBox(height: 10), // Adjust spacing between buttons
            SizedBox(
              width: double.infinity, // Make the button width stretch to fit screen width
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded edges
                    ),
                    backgroundColor: Colors.green, // Green background color
                  ),
                  child: const Text('Register', style: TextStyle(color: Colors.white)), // White text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
