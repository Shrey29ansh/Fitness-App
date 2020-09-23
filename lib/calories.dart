import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calories extends StatefulWidget {
  final imageUrl;
  Calories({this.imageUrl});
  @override
  _CaloriesState createState() => _CaloriesState(imageUrl: imageUrl);
}

class _CaloriesState extends State<Calories> {
  final imageUrl;
  _CaloriesState({this.imageUrl});
  bool loaded = false;
  var showimage = "";
  getimage() async {
    print(imageUrl);
    setState(() {
      showimage = imageUrl;
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getimage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          loaded
              ? Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        showimage,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                )
              : Container()
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CALORIES",
                    style: GoogleFonts.catamaran(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .3,
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("images/calories.jpg"),
                      height: 20,
                    ),
                    Text(
                      "2000 Cal",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 60,
                              backgroundImage: (AssetImage("images/gulab.jpg")),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.share),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: Text("Gulab Jamun",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[700])),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 8),
                                          child: SizedBox(
                                            child: Text(
                                                "Burning 2000 cal is almost equal to eating 50 Gulab Jamuns",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 60,
                              backgroundImage: (AssetImage("images/puri.jpg")),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.share),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: Text("Pani Puri",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[700])),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 8),
                                          child: SizedBox(
                                            child: Text(
                                                "Burning 2000 cal is almost equal to eating 100 Pani Puri's",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 60,
                              backgroundImage: (AssetImage("images/gulab.jpg")),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.share),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: Text("Gulab Jamun",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[700])),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 8),
                                          child: SizedBox(
                                            child: Text(
                                                "Burning 2000 cal is almost equal to eating 50 Gulab Jamuns",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 60,
                              backgroundImage: (AssetImage("images/puri.jpg")),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.share),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: Text("Pani Puri",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey[700])),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 8),
                                          child: SizedBox(
                                            child: Text(
                                                "Burning 2000 cal is almost equal to eating 100 Pani Puri's",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  /* ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
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
                  ), */
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
