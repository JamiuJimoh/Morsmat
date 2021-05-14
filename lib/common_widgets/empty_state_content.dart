import 'package:flutter/material.dart';

class EmptyStateContent extends StatelessWidget {
  final String title;
  final String message;

  const EmptyStateContent({
    Key? key,
    this.title: 'Nothing yet',
    this.message: 'Add a new item to get started',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10.0),
          Center(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
