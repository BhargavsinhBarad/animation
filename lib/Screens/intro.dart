import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_page extends StatefulWidget {
  const intro_page({super.key});

  @override
  State<intro_page> createState() => _intro_pageState();
}

class _intro_pageState extends State<intro_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "WELCOME TO OUR PLANET",
            body:
                "Everything You Want To Explore About The Universe Plants and Galaxy.",
            image: Center(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://gifdb.com/images/high/solar-system-illustration-loop-vk798bcypnl5zd2l.gif"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          PageViewModel(
            title: "WELCOME TO OUR PLANET",
            body:
                "Everything You Want To Explore About The Universe Plants and Galaxy.",
            image: Center(
              child: Container(
                // color: Colors.deepPurpleAccent,
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.dribbble.com/users/729829/screenshots/4252236/galshir-saturn-hula-hooping_still_2x.gif?resize=400x300&vertical=center"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ],
        done: Text("done"),
        onDone: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("isIntroVisited", true);
          Navigator.pushReplacementNamed(context, 'Splash');
        },
        next: Text("Next"),
        showNextButton: true,
      ),
    );
  }
}
