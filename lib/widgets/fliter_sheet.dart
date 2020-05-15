import 'package:app/constants.dart';
import 'package:app/store.dart';
import 'package:app/widgets/filter_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: white,
      ),
      height: 300.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Urutkan",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: gray,
                  ),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    size: 25.0,
                    color: gray,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: divider_color,
            thickness: 1.0,
            height: 1.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: store.filters
                  .map(
                    (filter) => FilterField(
                      filter: filter,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
