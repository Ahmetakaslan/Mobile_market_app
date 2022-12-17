import 'package:flutter/material.dart';
import 'package:flutter_application_detail_listview_builder/pages/SatinAl.dart';
import 'package:flutter_application_detail_listview_builder/pages/Yemekler.dart';

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
        primarySwatch: Colors.deepOrange,
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
  Future<List<Yemekler>> myData() async {
    var yemekListesi = <Yemekler>[];
    var a = Yemekler(1, "Ayran", "images/indir.jpg", 5, "170 ml");
    var b = Yemekler(2, "Köfte", "images/indir1.jpg", 29.90, "3 Köfte");
    var c = Yemekler(3, "Tost", "images/indir2.jpg", 25, "Tam Ekmek");
    var d = Yemekler(4, "Fanta", "images/indir3.jpg", 12, " 330 ml");
    var e = Yemekler(5, "CocaCola", "images/indir4.jpg", 13, "330 ml");
    var f = Yemekler(6, "Baklava", "images/indir5.jpg", 68);
    var g = Yemekler(7, "Lahmacun", "images/indir6.jpg", 15);
    var h = Yemekler(7, "Pide", "images/indir7.jpg", 25);
    var i = Yemekler(8, "Kebab", "images/indir8.jpg", 40);

    yemekListesi.add(a);
    yemekListesi.add(b);
    yemekListesi.add(c);
    yemekListesi.add(d);
    yemekListesi.add(e);
    yemekListesi.add(f);
    yemekListesi.add(g);
    yemekListesi.add(h);
    yemekListesi.add(i);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yemekler"),
        ),
        body: FutureBuilder(
          future: myData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var alinanVeriler = snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2 / 1),
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(children: [
                      SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 3,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(alinanVeriler[index].image))),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            alinanVeriler[index].name,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            alinanVeriler[index].price.toString() + "\u20BA",
                            style: TextStyle(fontSize: 25, color: Colors.blue),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        iconSize: 40,
                        icon: Icon(Icons.arrow_right_outlined),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SatinAl(
                                    alinanVeriler[index].name,
                                    alinanVeriler[index].price,
                                    alinanVeriler[index].image,
                                    alinanVeriler[index].explain),
                              ));
                        },
                      )
                    ]),
                  );
                },
                itemCount: alinanVeriler!.length,
              );
            } else {
              return Center();
            }
          },
        ));
  }
}
