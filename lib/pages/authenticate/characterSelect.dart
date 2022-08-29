import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CharacterSelect extends StatelessWidget {
  const CharacterSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Select Your Character"),
          const SizedBox(height: 20),
          SizedBox(
              height: 400,
              width: 400,
              child: Swiper(
                itemCount: 3,
                itemWidth: MediaQuery.of(context).size.width - 64,
                layout: SwiperLayout.STACK,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Card(
                        color: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 150),
                                child: const Text(
                                  "Smino",
                                  style: TextStyle(fontSize: 30),
                                ))
                          ],
                        ),
                      )
                    ],
                  );
                },
              )),
        ],
      ),
    );
  }
}
