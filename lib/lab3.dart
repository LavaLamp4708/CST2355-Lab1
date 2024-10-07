import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Text("BY MEAT"),
            Column(
              children: [
                Text(
                  "BROWSE CATEGORIES",
                  style: TextStyle(
                      fontSize: 60
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Not sure exactly what recipe you're looking for? Do a search, or dive into our most popular categories.",
                      style: TextStyle(
                          fontSize: 25
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text(
                    "BY MEAT",
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/beef.jpg'),
                          radius: 60,
                        ),
                        Text(
                          "BEEF",
                          style: TextStyle(
                            fontSize: 25,
                            //color: Colors.grey
                          )
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/chicken.jpg'),
                          radius: 60,
                        ),
                        Text(
                          "CHICKEN",
                          style: TextStyle(
                            //color: Colors.grey,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [

                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/pork.jpg',),
                          radius: 60,
                        ),
                        Text(
                          "PORK",
                          style: TextStyle(
                            //color: Colors.grey,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/seafood.jpg',),
                          radius: 60,
                        ),
                        Text(
                          "SEAFOOD",
                          style: TextStyle(
                            //color: Colors.grey,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    )
                ],),
              ],
            ),
            //Text("BY COURSE"),
            Column(
              children: [
                Text(
                    "BY COURSE",
                  style: TextStyle(
                      fontSize: 35
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/main_dishes.jpg'),
                          radius: 60,
                        ),
                        Text(
                          "MAIN DISHES",
                          style: TextStyle(
                            fontSize: 25
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/salad.jpg'),
                          radius: 60,
                        ),
                        Text(
                          "SALAD RECIPES",
                          style: TextStyle(
                              fontSize: 25
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/side_dishes.jpg'),
                          radius: 60,
                        ),
                        Text(
                          "SIDE DISHES",
                          style: TextStyle(
                              fontSize: 25
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/images/crock_pot.jpg'),
                          radius: 60,
                        ),
                        Text(
                          "CROCKPOT",
                          style: TextStyle(
                              fontSize: 25
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "DESSERTS",
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("lib/images/ice_cream.jpg"),
                          radius: 60,
                        ),
                        Text(
                          "ICE CREAM",
                          style: TextStyle(
                            fontSize: 25
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("lib/images/brownies.jpg"),
                          radius: 60,
                        ),
                        Text(
                          "BROWNIES",
                          style: TextStyle(
                            fontSize: 25
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("lib/images/pies.jpg"),
                          radius: 60,
                        ),
                        Text(
                          "PIES",
                          style: TextStyle(
                            fontSize: 25
                          )
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("lib/images/cookies.jpg"),
                          radius: 60,
                        ),
                        Text(
                          "COOKIES",
                          style: TextStyle(
                            fontSize: 25
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
