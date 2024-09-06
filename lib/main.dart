import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const IntroApp());
}

class IntroApp extends StatelessWidget {
  const IntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: ([Colors.white,Colors.red]),
          ),
        ),
      ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Among Us',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset('asset/image/game.jpg',
            height: 250,
            width: 300,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.white38,
              ),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: 'Hello,Pookie!!',
                    textColor: Colors.white,
                    backgroundColor: Colors.teal,
                    gravity: ToastGravity.BOTTOM_LEFT,
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 16,
                  );
                },
                child: const Text('Click Me',
                style: TextStyle(
                  color: Colors.black87
                ),))
          ],
        ),
      ),
    );
  }
}
