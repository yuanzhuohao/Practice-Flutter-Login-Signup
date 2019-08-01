import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tab_painter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        cursorColor: Colors.orange
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  PageController _controller;

  Color leftColor = Colors.black;
  Color rightColor = Colors.white;

  bool _obscureText = true;

  @override
  void initState() {
    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        
      });
      // print('${_controller.page}');
      // print('Position: ${_controller.position.maxScrollExtent}, ${_controller.position.minScrollExtent}');
      // print('Viewpoint: ${_controller.position.viewportDimension}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
                  child: SingleChildScrollView(
                    child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.red],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // stops: [0.8, 0.8],
                  tileMode: TileMode.clamp
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: CustomPaint(
                      painter: TabPainter(controller: _controller),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: (){
                              _controller.animateToPage(
                                0, duration: Duration(milliseconds: 200), curve: Curves.ease
                              );
                            },
                            child: Text("登录", style: TextStyle(color: leftColor),),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          FlatButton(
                            onPressed: () {
                              _controller.animateToPage(
                                1, duration: Duration(milliseconds: 200), curve: Curves.ease
                              );
                            },
                            child: Text("注册", style: TextStyle(color: rightColor),),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                      child: PageView(
                      controller: _controller,
                      
                      onPageChanged: (i){
                        final Color temp = leftColor;
                        leftColor = rightColor;
                        rightColor = temp;
                      },
                      children: <Widget>[
                        _buildOnePage(),
                        _buildTwoPage(),
                        // _buildOnePage(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      );
  }

  Widget _buildOnePage() {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Container(
                width: 300,
                height: 200,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "输入手机号码",
                          border: InputBorder.none,
                          icon: Icon(Icons.phone)
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: "输入密码",
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash, size: 20,),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), 
            Container(
              margin: EdgeInsets.only(top: 190),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.red]

                )
              ),
              child: MaterialButton(
                onPressed: () {

                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Text("登陆", style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: FlatButton(
            onPressed: () {},
            child: Text("忘记密码?", style: TextStyle(color: Colors.white),),
          ),
        )
      ],
    );
  }


  Widget _buildTwoPage() {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Container(
                width: 300,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "输入手机号码",
                          border: InputBorder.none,
                          icon: Icon(Icons.phone)
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: "输入密码",
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash, size: 20,),
                          )
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: "输入密码",
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash, size: 20,),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), 
          ],
        ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.red]

                )
              ),
              child: MaterialButton(
                onPressed: () {

                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: Text("注册", style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
            )
      ],
    );
  }
}
