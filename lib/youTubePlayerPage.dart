import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Social Media Links'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,

            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://twitter.com/TecherrorNR?t=b7v1M6rs36mIiYERYq3amg&s=09');
                },
                icon: FaIcon(FontAwesomeIcons.x),
                label: Text('Twitter'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://www.instagram.com/techerrornr.post/');
                },
                  icon: FaIcon(FontAwesomeIcons.instagram),
                label: Text('Instagram'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://www.linkedin.com/in/techerrornr/');
                },
                  icon: FaIcon(FontAwesomeIcons.linkedinIn),
                label: Text('LinkedIn'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://www.youtube.com/channel/UCW6IYHDQe1JrRy6KsxAOJzQ');
                },
                  icon: FaIcon(FontAwesomeIcons.youtube),
                label: Text('YouTube'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://github.com/techerrorNR');
                },
                icon: FaIcon(FontAwesomeIcons.github),
                label: Text('GIT-HUB'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
