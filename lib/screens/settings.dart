import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
          title: Text(
            "Setting",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'cari apa hayo',
                    filled: true,
                    fillColor: Colors.grey[300],
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 25.0,
                                ),
                                SizedBox(width: 10.0),
                                Text("Account"),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15.0,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.notifications,
                                  size: 25.0,
                                ),
                                SizedBox(width: 10.0),
                                Text("Notification"),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15.0,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.lock,
                                  size: 25.0,
                                ),
                                SizedBox(width: 10.0),
                                Text("Privacy settings"),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15.0,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.headset,
                                  size: 25.0,
                                ),
                                SizedBox(width: 10.0),
                                Text("Help"),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15.0,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.help_outline,
                                  size: 25.0,
                                ),
                                SizedBox(width: 10.0),
                                Text("About"),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15.0,
                          )
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
