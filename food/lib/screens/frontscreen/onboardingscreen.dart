import 'package:flutter/material.dart';
import 'package:food/screens/frontscreen/home%20page/homescreen.dart';
import 'package:food/widgets/onboardingcard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: PageView(
          controller: controller,
          children: [
             Onboardingcard(
              img: 'assets/img/chef.png',
              title: 'Order from choosen chef',
              subtitle:
                  'Get all your loved foods in one place.\nYou just place the order, we do the rest.',
            ),
             Onboardingcard(
              img: 'assets/img/deliveryman.png',
              title: 'Free delivery offers',
              subtitle:
                  'Get all your loved foods in one place.\nYou just place the order, we do the rest.',
            ),
            Onboardingcard(
              img: 'assets/img/services.png',
              title: 'All your favorites',
              subtitle:
                  'Get all your loved foods in one place.\nYou just place the order, we do the rest.',
            ),
            
          
            
          ],
        ),
      ),
      bottomSheet: Container(
        height: 200,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                spacing: 5,
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Color.fromARGB(41, 0, 0, 0),
                activeDotColor: Colors.deepOrange,
              ),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease),
            ),
            const SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Container(
            //     width: double.infinity,
            //     height: 50,
            //     decoration: BoxDecoration(
            //       color: Colors.amber,
            //       borderRadius: BorderRadius.circular(10)
            //     ),
            //     child: Center(child: Text('Next')),
            //   ),
            // )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     if (controller.page == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homescreen()),
                  );
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(fontFamily: 'Sen', fontSize: 14),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                                      Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Onboardingscreen()));
                  },
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                  child: Text('Skip'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
