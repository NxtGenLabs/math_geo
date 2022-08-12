import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:math_geometry/themes/textStyles.dart';
import 'package:math_geometry/widgets/actionButton.dart';
import 'package:math_geometry/widgets/characterCard.dart';
import 'package:math_geometry/widgets/scrollWheel.dart';

class GenderXAge extends StatelessWidget {
  const GenderXAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CharacterCard> characters = [
      const CharacterCard("images/characters/female_character.png", "Female"),
      const CharacterCard("images/characters/male_character.png", "Male"),
      const CharacterCard("images/characters/other.png", "Other")
    ];
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
              const Text(
                'Select your gender',
                style: ThemeText.chapter,
              ),
              SizedBox(
                height: 300,
                child: Swiper(
                  scale: 2,
                  layout: SwiperLayout.STACK,
                  itemCount: characters.length,
                  itemWidth: MediaQuery.of(context).size.width + 2 * 350,
                  itemBuilder: (BuildContext context, index) {
                    return characters[index];
                  },
                  control: const SwiperControl(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Whats your age:', style: ThemeText.chapter),
                  ScrollWheel()
                ],
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
