import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/calories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fitness/login_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name = "";
String email = "";
String imageUrl = "";

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;
  print(user.getIdToken());
  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoURL != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoURL;

  // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
    print(name);
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = _auth.currentUser;
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String finalDate = '';
  String actualMonth = '';
  bool loaded = false;
  getCurrentDate() {
    var date = new DateTime.now().toString();
    print(date);
    var dateParse = DateTime.parse(date);
    print(dateParse.month);
    List month = [
      "null",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    actualMonth = month[dateParse.month];
    print(actualMonth);
    var formattedDate = "${dateParse.day}-$actualMonth-${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
    });
  }

  Future getUserdata() async {
    final User user = _auth.currentUser;
    setState(() {
      name = user.displayName;
      email = user.email;
      imageUrl = user.photoURL;
      loaded = true;
    });
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
      print(name);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentDate();
    getUserdata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: new IconThemeData(color: Colors.green),
            title: Text(
              "Fitness App",
              style: TextStyle(color: Colors.green),
            ),
          ),
          drawer: Container(
            color: Colors.black,
            child: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                      child: Column(children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        signOutGoogle();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }), ModalRoute.withName('/'));
                      },
                      color: Colors.deepPurple,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    )
                  ]))
                ],
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              name.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        loaded
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(
                                  imageUrl,
                                ),
                                radius: 50,
                                backgroundColor: Colors.transparent,
                              )
                            : Container(),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Today, $finalDate",
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ],
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                          elevation: 6,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Calories(
                                            imageUrl: imageUrl,
                                          )));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage("images/calories.jpg"),
                              ),
                            ),
                            title: Center(
                              child: Text(
                                "CALORIES",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            subtitle: Center(child: Text("2000")),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                          elevation: 6,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onTap: () {
                              getCurrentDate();
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage("images/steps.jpg"),
                              ),
                            ),
                            title: Center(
                              child: Text(
                                "STEPS",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            subtitle: Center(child: Text("5000")),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                          elevation: 6,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            onTap: () {
                              getCurrentDate();
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage("images/heart.png"),
                              ),
                            ),
                            title: Center(
                              child: Text(
                                "HEART BEAT",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            subtitle: Center(child: Text("60")),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 50,
                    child: Text(
                      "SOS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
