import 'package:flutter/material.dart';

class FirebaseEmptyStatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            'No meals yet',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Text(
            'Start adding meals',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
