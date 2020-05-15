import 'package:app/widgets/filter_button.dart';
import 'package:app/widgets/list.dart';
import 'package:app/store.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile App',
      home: ChangeNotifierProvider<Store>(
        create: (context) => Store(),
        child: Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengumuman'),
        backgroundColor: salmon,
        flexibleSpace: Image(
          image: AssetImage('assets/pattern.png'),
          fit: BoxFit.contain,
          height: double.infinity,
          alignment: Alignment.bottomCenter,
        ),
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: white,
            child: Icon(
              Icons.arrow_back,
              color: gray,
            ),
          ),
        ),
      ),
      body: AnimatedOpacity(
        opacity: store.active ? 1 : 0.5,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 30.0,
                  bottom: 15.0,
                ),
                child: Text(
                  "Urut berdasarkan \"${store.getActiveFilter()}\"",
                  style: TextStyle(
                    color: gray,
                    fontSize: 18.0,
                  ),
                ),
              ),
              EventsList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FilterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
