import 'package:flutter/material.dart';
import 'package:posttest6_1915016081_nurfadila/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(226, 244, 154, 1),
      appBar: AppBar(
        title: Text("Green Shop"),
        backgroundColor: Color.fromRGBO(42, 57, 0, 1),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 192,
                height: 243,
                margin: EdgeInsets.only(top: 61),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/botol.png"),
                  ),
                ),
              ),
              Text(
                "Botol Minum \n",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(111, 128, 97, 1),
                ),
              ),
              Container(
                width: 450,
                height: 180,
                margin: EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 245, 237, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "   - Kapasitas 750ml, tahan panas, dan tidak mudah pecah/retak. \n  - Terdapat slot di bawah botol untuk menaruh obat/kunci/dll. \n  - Tersedia 3 ukuran. \n\n\n 150K IDR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(111, 128, 97, 1),
                    wordSpacing: 3,
                    height: 2,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizeContainer(size: "500ml"),
                  SizeContainer(size: "750ml"),
                  SizeContainer(size: "1L"),
                  //siActive: true
                ],
              ),
              MyButton(),
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
                    padding: EdgeInsets.fromLTRB(200.0, 25.0, 200.0, 25.0),
                    backgroundColor: Color.fromRGBO(76, 50, 43, 1),
                    primary: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SizeContainer extends StatelessWidget {
  const SizeContainer({Key? key, this.isActive = false, required this.size})
      : super(key: key);

  final bool isActive;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 85,
        height: 60,
        alignment: Alignment.center,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromRGBO(175, 218, 45, 1),
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
          ),
          onPressed: () {
            color:
            Colors.green;
          },
          child: Text(
            size,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              // color: isActive ? Colors.white : Color.fromRGBO(111, 128, 97, 1),
            ),
          ),
        ));
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      height: 55,
      margin: EdgeInsets.only(top: 50, bottom: 30),
      child: TextButton(
        onPressed: () {},
        child: const Text("Pesan Sekarang"),
        style: TextButton.styleFrom(
            // padding: EdgeInsets.fromLTRB(200.0, 25.0, 200.0, 25.0),
            backgroundColor: Color.fromRGBO(71, 105, 48, 1),
            // shadowColor: MaterialStateProperty.all<Color>(Colors.green),
            primary: Colors.white),
      ),
    );
  }
}