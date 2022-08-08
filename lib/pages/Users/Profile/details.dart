import 'package:flutter/material.dart';

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  width: currentWidth,
                  child: const Text(
                    "Personal Details",
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                Container(
                  width: currentWidth,
                  child: Wrap(
                    runSpacing: 8,
                    children: [
                      KeyValuePair(
                        k3y: "Full Name: ",
                        value: "Bright Nthara",
                      ),
                      KeyValuePair(
                        k3y: "Age: ",
                        value: "16",
                      ),
                      KeyValuePair(
                        k3y: "Gender: ",
                        value: "I don't wany to say",
                      ),
                      KeyValuePair(
                        k3y: "Character: ",
                        value: "Lulu",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  width: currentWidth,
                  child: const Text(
                    "Personal Details",
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                Container(
                  width: currentWidth,
                  child: Wrap(
                    runSpacing: 8,
                    alignment: WrapAlignment.start,
                    children: [
                      KeyValuePair(
                        k3y: "Postion:: ",
                        value: "3",
                      ),
                      KeyValuePair(
                        k3y: "Total Time Spent(mins): ",
                        value: "72",
                      ),
                      KeyValuePair(
                        k3y: "Avg. Time Spent(mins): ",
                        value: "3",
                      ),
                      KeyValuePair(
                        k3y: "Levels Completed: ",
                        value: "7",
                      ),
                      KeyValuePair(
                        k3y: "Total score: ",
                        value: "130000",
                      ),
                      KeyValuePair(
                        k3y: "Avg. Stars: ",
                        value: "4.2",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          )
        ],
      ),
    );
  }
}

class KeyValuePair extends StatelessWidget {
  KeyValuePair({
    required this.k3y,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String k3y;
  var value;

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    return Container(
      width: currentWidth * 0.3,
      child: Center(
        child: Row(
          children: [
            Text(
              k3y,
              style: const TextStyle(
                color: Color.fromARGB(255, 140, 140, 140),
                fontSize: 20,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
