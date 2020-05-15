import 'package:app/constants.dart';
import 'package:app/store.dart';
import 'package:app/widgets/fliter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    return store.active
        ? FloatingActionButton.extended(
            label: Text('Urutkan'),
            icon: Icon(Icons.sort),
            backgroundColor: blue,
            onPressed: () {
              var sheetController = showBottomSheet(
                  context: context,
                  builder: (context) {
                    return FilterSheet();
                  });
              store.toggle(false);
              sheetController.closed.then((_) {
                store.toggle(true);
              });
            },
          )
        : Container();
  }
}
