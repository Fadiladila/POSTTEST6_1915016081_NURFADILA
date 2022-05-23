import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_1915016081_nurfadila/splashscreen.dart';
import 'package:posttest6_1915016081_nurfadila/home.dart';
import 'package:posttest6_1915016081_nurfadila/custom_alert.dart';
import 'controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Posttest 6 Nur Fadila',
      home: SplashScreen(),
      debugShowCheckedModeBanner:
          false, //buat ngilangin tulisan debug di kanan atas
    );
  }
}

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final CounterController c = Get.put(CounterController());
  final SwitchController sw = Get.put(SwitchController());
  final TextController tc = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Green Shop"),
        flexibleSpace: Obx(
          () => Container(
            color: sw.switchValue.value ? Color.fromRGBO(42, 57, 0, 1) : Color.fromARGB(255, 67, 10, 119),
          ),
        ),
        actions: [
          Obx(
            () => Switch(
              value: sw.switchValue.value,
              onChanged: (newvalue) => sw.setValue(newvalue),
            ),
          ),
        ],
      ),
      body: 
      ListView(children: [
        Container(
          width: 192,
          height: 243,
          margin: EdgeInsets.only(top: 61),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/pohon2.png"),
            ),
          ),
        ),
        Text(
          "\nYour Habit, Your Life",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(76, 50, 43, 1),
          ),
        )
      ]),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Your Habit, Your Life"),
              decoration: BoxDecoration(
                color: Color.fromARGB(110, 226, 244, 154),
              ),
            ),
            ListTile(
              // tileColor: Colors.green,
              leading: Icon(Icons.shopping_basket),
              title: Text("Check Out"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LandingPage()),
                );
              },
            ),
            ListTile(
              // tileColor: Color.fromARGB(232, 186, 69, 69),
              leading: Icon(Icons.check),
              title: Text("Pemesanan"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ThirdPage()),
                );
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: c.increment,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  final TextController tc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => Text('${tc.name.value}')),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String nama = "";
  bool? isHadiah = false;
  List<String> pengiriman = ["Kurir", "Ambil Sendiri"];
  String kirim = "";

  final namaController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(226, 244, 154, 1),
      appBar: AppBar(
        title: Text("Green Shop"),
        backgroundColor: Color.fromRGBO(42, 57, 0, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "\n\nCheckout",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(111, 128, 97, 1),
              ),
            ),
            SizedBox(height: 30), //jarak antar textfield

            for (var item in pengiriman)
              ListTile(
                leading: Radio(
                  value: item,
                  groupValue: kirim,
                  onChanged: (String? value) {
                    setState(() {
                      kirim = value!;
                    });
                  },
                ),
                title: Text(item),
              ),

            ListTile(
              leading: Checkbox(
                  value: isHadiah,
                  onChanged: (bool? value) {
                    setState(() {
                      isHadiah = value;
                    });
                  }),
              title:
                  Text("apakah anda ingin membeli barang ini sebagai hadiah?"),
            ),
            SizedBox(height: 30),
            TextField(
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan nama anda",
                )),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  CustomAlert(context, "Data anda tersimpan!");
                  setState(() {
                    nama = namaController.text;
                  });
                },
                child: Text("Checkout"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(111, 128, 97, 1),
                ),
              ),
            ),
            Text(
              "nama : $nama",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
            Text(
              "jenis pengantaran: $kirim",
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MyHomePage(),
                    ));
              },
              child: const Text("Home"),
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(76, 50, 43, 1),
                  primary: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}