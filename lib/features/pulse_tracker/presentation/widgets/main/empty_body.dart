import 'package:flutter/material.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No records yet',
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: Colors.grey),
      ),
    );
  }
}
