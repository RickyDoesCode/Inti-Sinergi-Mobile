import 'package:app/constants.dart';
import 'package:app/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterField extends StatelessWidget {
  final Map filter;
  FilterField({this.filter});
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    return InkWell(
      onTap: () {
        store.toggleCheckbox(filter);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              filter["text"],
              style: TextStyle(
                fontSize: 15.0,
                color: gray,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: filter["active"]
                    ? Border.all(
                        width: 0.0,
                        color: transparent,
                      )
                    : Border.all(
                        width: 4.0,
                        color: circle_gray,
                      ),
              ),
              child: Padding(
                padding: filter["active"]
                    ? EdgeInsets.all(0.0)
                    : EdgeInsets.all(2.0),
                child: filter["active"]
                    ? Icon(
                        Icons.check_circle,
                        color: blue,
                        size: 32.0,
                      )
                    : Icon(
                        Icons.check,
                        color: transparent,
                        size: 20.0,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
