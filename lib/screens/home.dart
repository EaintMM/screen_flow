import 'package:flutter/material.dart';
import 'package:screen_flow/screens/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'This is Home',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Login to see more'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
