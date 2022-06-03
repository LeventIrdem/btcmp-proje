import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShoppingList App',
      home: appBar(),
    );
  }
}

class appBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.amber),
        centerTitle: true,
        title: Text('Shopping List'),
        titleTextStyle: TextStyle(
            color: Colors.white,
            decorationColor: Colors.black12,
            fontWeight: FontWeight.bold),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List alisverisListesi = [];
  TextEditingController t1 = TextEditingController();
  urunEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  urunCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Flexible(
          child: ListView.builder(
            itemCount: alisverisListesi.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(alisverisListesi[index]),
            ),
          ),
        ),
        TextField(
          controller: t1,
        ),
        ElevatedButton(
          onPressed: urunEkle,
          child: Text(
            'EKle',
          ),
        ),
        ElevatedButton(
          onPressed: urunCikar,
          child: Text('Çıkar'),
        ),
      ]),
    );
  }
}
