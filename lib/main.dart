// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/sign_in.dart';
import 'package:flutter/material.dart';

import 'package:fitness/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool status;
  var imageUrl;
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    status
        ? Navigator.push(
            context, new MaterialPageRoute(builder: (context) => FirstScreen()))
        : Navigator.push(
            context, new MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void checkstatus() async {
    // ignore: await_only_futures
    final User currentUser = await _auth.currentUser;
    print(currentUser);

    if (currentUser != null) {
      setState(() {
        imageUrl = currentUser.photoURL;
        status = true;
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    this.checkstatus();
    this.startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Card(
                  elevation: 10, child: new Image.asset('images/fitness.png'))),
        ],
      ),
    );
  }
}
