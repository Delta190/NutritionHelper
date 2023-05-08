///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          ///***If you have exported images you must have to copy those images in assets/images directory.
          Image(
            image: AssetImage("assets/images/logo.png"),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment(0.0, -0.8),
            child: Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0x00000000),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.zero,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Log In",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontSize: 28,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  padding: EdgeInsets.all(0),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff000c6a),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12),
                            child:

                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                              image: AssetImage("assets/images/Facebook.png"),
                              height: 25,
                              width: 25,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Text(
                            "Continue with Facebook",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Color(0x00ffffff),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xff000000),
                        height: MediaQuery.of(context).size.height * 0.4,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffe3d8d8),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12),
                            child:

                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                              image: AssetImage("assets/images/google.png"),
                              height: 25,
                              width: 25,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Text(
                            "Continue with Google",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {},
                        color: Color(0x00ffffff),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xff000000),
                        height: MediaQuery.of(context).size.height,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
