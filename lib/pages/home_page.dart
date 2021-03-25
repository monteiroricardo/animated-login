import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color(0xff333851),
      ));
  IconData passwordIcon = FontAwesomeIcons.eyeSlash;
  bool obscureText = true;

  List<Map<String, dynamic>> map = [
    {
      "height": 0,
      "primary": null,
      "accent": Colors.red[200],
    },
    {
      "height": 75,
      "primary": Colors.red[600],
      "accent": Colors.red[200],
    },
    {
      "height": 150,
      "primary": Colors.yellow[600],
      "accent": Colors.yellow[200],
    },
    {
      "height": 400,
      "primary": Colors.green[600],
      "accent": Colors.green[200],
    },
  ];

  TextEditingController emailC = TextEditingController();
  TextEditingController senhaC = TextEditingController();

  setIndex() {
    if (emailC.text.isEmpty || senhaC.text.isEmpty) {
      setState(() {
        index = 0;
      });
    }
    if (emailC.text.isNotEmpty && senhaC.text.isEmpty) {
      setState(() {
        index = 1;
      });
    }
    if (emailC.text.isNotEmpty && senhaC.text.isNotEmpty) {
      setState(() {
        index = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333851),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      color: map[index]['accent'],
                      width: 400,
                      height: 10,
                    ),
                    AnimatedContainer(
                      color: map[index]['primary'],
                      duration: Duration(milliseconds: 400),
                      width: map[index]['height'],
                      height: 10,
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333851),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffbfc8f2)),
                        height: 45,
                        width: 290,
                        child: TextFormField(
                          onChanged: (value) {
                            setIndex();
                          },
                          style: TextStyle(
                            color: Color(0xff333851),
                          ),
                          controller: emailC,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'E-mail',
                            hintStyle: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 15,
                              color: Color(0xff333851),
                            ),
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              size: 20,
                              color: Color(0xff333851),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffbfc8f2)),
                        height: 45,
                        width: 290,
                        child: TextFormField(
                          onChanged: (value) {
                            setIndex();
                          },
                          style: TextStyle(
                            color: Color(0xff333851),
                          ),
                          controller: senhaC,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Rubik',
                                color: Color(0xff333851),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 20,
                                color: Color(0xff333851),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordIcon,
                                  size: 20,
                                  color: Color(0xff333851),
                                ),
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                    if (obscureText) {
                                      passwordIcon = FontAwesomeIcons.eyeSlash;
                                    } else {
                                      passwordIcon = FontAwesomeIcons.eye;
                                    }
                                  });
                                },
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 60),
                            child: Text(
                              'forget password',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff333851),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (index == 2) {
                            setState(() {
                              index = 3;
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Color(0xffbfc8f2),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff333851),
                          ),
                          width: 290,
                          height: 45,
                        ),
                      )
                    ],
                  ),
                  color: Colors.white,
                  width: 400,
                  height: 400,
                )
              ]),
        ),
      ),
    );
  }
}
