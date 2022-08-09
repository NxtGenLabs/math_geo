import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:math_geometry/widgets/actionButton.dart';

class ChooseCharacter extends StatelessWidget {
  const ChooseCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Choose your character"),
              SizedBox(
                height: 300,
                child: Swiper(
                  scale: 2,
                  layout: SwiperLayout.STACK,
                  itemCount: 3,
                  itemWidth: MediaQuery.of(context).size.width + 2 * 250,
                  itemBuilder: (BuildContext context, index) {
                    return Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 288,
                              width: 230,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          50, 105, 105, 105))),
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(40.0),
                                    child: Image(
                                        image: AssetImage(
                                            'images/male_character.png')),
                                  ),
                                  Text("Name")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  control: const SwiperControl(),
                ),
              ),
              ActionButton(
                  text: "Continue",
                  onPress: () {
                    Navigator.pushNamed(
                        context, './pages/authenticate/submitPage');
                  })
            ],
          ),
        )));
  }
}
