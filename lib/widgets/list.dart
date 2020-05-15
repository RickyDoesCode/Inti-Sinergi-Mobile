import 'package:app/store.dart';
import 'package:app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: store.events.length,
          itemBuilder: (context, index) {
            return EventCard(index: index);
          }),
    );
  }
}
