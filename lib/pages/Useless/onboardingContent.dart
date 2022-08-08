// class OnboardingContent {
//   String image;
//   String title;
//   String description;

//   OnboardingContent({this.image, this.title, this.description});
// }

// List<OnboardingContent> contents = [
//   OnboardingContent(
//     title: "Learn hundreds of new skills",
//     image: 'assets/images/Robot-hi.png',
//     description: "Gain ton of new knowledge from many stem topics, each taught with step-by-step guiadance and assistance",
//   ),
//     OnboardingContent(
//     title: "Solve real world problems",
//     image: 'assets/images/Robot-hi.png',
//     description: "Apply what you’ve learnt in real world situations, easily relatable to give you a better understanding of the reason for knowing ",
//   ),
//     OnboardingContent(
//     title: "Interact in fun and engaging ways",
//     image: 'assets/images/Robot-hi.png',
//     description: "Built with game mechnics such leaderboards, scores and much more providing many interesting ways of challenging  and testing you, ensuring you understand the topics for longer in a ",
//   ),
// ];

// itemCount: 3,
// itemBuilder: (_, i) {
//   return Padding(
//     padding: const EdgeInsets.all(40),
//     child: Column(
//       children: [
//         Image.asset(
//           'assets/images/Robot-hi.png',
//           height: 300,
//         ),
//         const Text(
//           "Learn hundreds of new skills",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         SizedBox(height: 20,),
//         const Text(
//           "Gain ton of new knowledge from many stem topics, each taught with step-by-step guiadance and assistance",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.grey,
//           ),
//         )
//       ],
//     ),
//   );
// },