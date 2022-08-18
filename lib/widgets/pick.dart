import 'package:flutter/material.dart';

import '../themes/textStyles.dart';

class Pick extends StatelessWidget {
  final String pick;
  final Function() onTap;
  const Pick(this.pick, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Material(
        color: const Color.fromARGB(255, 217, 217, 217),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 40,
            width: 40,
            child: Center(child: Text(pick, style: ThemeText.multipleChoice)),
          ),
        ),
      ),
    );
  }
}
