import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahaay/Animation/background_animation.dart';
import 'package:sahaay/Widgets/landing_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const Color mainGreen = Color.fromARGB(255, 9, 111, 82);
    return FloatingTextBackground(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Find Your Path to\nGrowth & Clarity',
              style: TextStyle(
                color: mainGreen,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'A learning space where guidance meets\nself-discovery, no communities',
              textAlign: TextAlign.center,
              style: TextStyle(color: const Color.fromARGB(255, 26, 162, 31)),
            ),
            SizedBox(height: 32),
            ClipRRect(
              borderRadius: BorderRadius.circular(0),

              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 0.8,
                    children: [
                      FeatureCard(
                        icon: FontAwesomeIcons.lightbulb,
                        title: 'AI-Guided First Aid',
                        subtitle: 'Instant coping support when\nmost.',
                      ),
                      FeatureCard(
                        icon: FontAwesomeIcons.calendar,
                        title: 'Confidential Booking',
                        subtitle: 'Private sessions',
                      ),
                      FeatureCard(
                        icon: FontAwesomeIcons.users,
                        title: 'Peer Support',
                        subtitle: 'Student-to-student care\nunderstanding',
                      ),
                      FeatureCard(
                        icon: FontAwesomeIcons.bookOpen,
                        title: 'Resource Hub',
                        subtitle: 'Guides & audios',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
