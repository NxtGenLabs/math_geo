import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/actionButton.dart';
import 'package:math_geometry/widgets/scrollWheel.dart';

class GenderXAge extends StatelessWidget {
  const GenderXAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(227, 242, 218, .15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text('Select your gender', style: ThemeText.chapter,),
              SizedBox(
                height: 300,
                child: Swiper(
                  scale: 2,
                  layout: SwiperLayout.STACK,
                  itemCount: 3,
                  itemWidth: MediaQuery.of(context).size.width + 2 * 350,
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
                                  Text("Male")
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Whats your age:', style: ThemeText.chapter), ScrollWheel()],
              ),
              ActionButton(
                  text: "CONTINUE",
                  onPress: () {
                    Navigator.pushNamed(
                        context, './pages/authenticate/chooseCharacter');
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
