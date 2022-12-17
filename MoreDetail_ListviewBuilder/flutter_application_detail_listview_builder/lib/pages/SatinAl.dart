import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SatinAl extends StatefulWidget {
  String name;
  double price;
  String myImage;
  String? explain = "";
  SatinAl(this.name, this.price, this.myImage, [this.explain]);

  @override
  State<SatinAl> createState() => _SatinAlState();
}

class _SatinAlState extends State<SatinAl> {
  bool cikilsinMi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(widget.myImage),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.name}",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "  " + widget.explain!,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          Text(
            "${widget.price}\u20BA",
            style: TextStyle(fontSize: 25, color: Colors.blue),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(context: context,builder:(context) =>   CupertinoAlertDialog(
                  title: Text("Siparişi Onaylıyormusunuz"),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("Evet"),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Sipariş Verildi!")));
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("iptal"),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Sipariş iptal Edildi!")));
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                );
              
              },
              child: Text("Sipariş Ver")),
        ],
      )),
    );
  }
}
