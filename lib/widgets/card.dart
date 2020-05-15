import 'package:app/constants.dart';
import 'package:app/store.dart';
import 'package:app/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  final int index;
  EventCard({this.index});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    Map item = store.events[index];
    Map button = store.getStatus(item["confirmed"]);
    Color borderColor = store.getBorderColor(button["backgroundColor"]);
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 10.0, 12.0, 12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${item["name"]}",
                          style: TextStyle(
                            color: gray,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Opacity(
                          opacity: button["disabled"] ? 0.0 : 1.0,
                          child: Icon(
                            Icons.notifications_active,
                            size: 20.0,
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: <Widget>[
                      GreyIcon(
                        icon: Icons.face,
                      ),
                      Text(
                        "${item["attendee"]}",
                        style: TextStyle(
                          color: gray,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: <Widget>[
                      GreyIcon(
                        icon: Icons.location_city,
                      ),
                      Text(
                        "${item["venue"]}",
                        style: TextStyle(
                          color: gray,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          GreyIcon(
                            icon: Icons.event_note,
                          ),
                          Text(
                            "${store.getDate(item["date"])}",
                            style: TextStyle(
                              color: gray,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            GreyIcon(
                              icon: Icons.watch_later,
                            ),
                            Text(
                              "${item["time"]}",
                              style: TextStyle(
                                color: gray,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: borderColor,
            thickness: 1.0,
            height: 1.0,
          ),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              color: button["backgroundColor"],
              child: Text(
                "${button["text"]}",
                style: TextStyle(
                  color: button["color"],
                  fontSize: 15.0,
                ),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: white,
        boxShadow: [
          BoxShadow(
            color: grayShadow,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
