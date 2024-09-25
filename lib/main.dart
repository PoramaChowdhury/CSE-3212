import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setting Screen',
      home: SettingScreen(),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notification = false;
  String _selectedTheme = 'Dark';
  double _rating = 3.0;
  double _volume = 50.0;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey,Colors.blueGrey])
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///CheckBox
              const Text(
                'Check Box',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.deepPurple,
                ),
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1,
                    child: buildCheckbox(),
                  ),
                  const Text(
                    'Enable Notification',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Text('Choose Theme',style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.green,
              ),),
              const SizedBox(height: 20),
              ///Radio
              buildRowRadio(),

              const SizedBox(height: 20),

              ///RatingBar
              const Text('Rate',style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.teal,
              ),),
              buildRatingBar(),

              const SizedBox(height: 20),

              ///Slider
              Text('Volume: ${_volume.toInt()}'),
              buildSlider(),

              const SizedBox(height: 20),

              ///Switch
              Column(
                children: [
                  buildRowSwitch(),
                ],
              ),

            ],
          ),
        ));
  }



  Widget buildCheckbox() {
    return Checkbox(
        shape: const CircleBorder(
            side: BorderSide(width: 0.5, color: Colors.blueGrey)),
        checkColor: Colors.blueGrey,
        activeColor: Colors.lightGreen,
        value: _notification,
        onChanged: (value) {
          setState(() {
            _notification = value!;
          });
          if (_notification) {
            _showSnackBar('Welcome');
          }
        });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

  Widget buildRowRadio() {
    return Row(
      children: [
        Radio(
            activeColor: Colors.black87,
            value: "Dark",
            groupValue: _selectedTheme,
            onChanged: (value){
              setState(() {
                _selectedTheme = value!;
              });
            }),
        const Text('Dark',style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),),
        const SizedBox(width:90),
        Radio(
            activeColor: Colors.grey,
            value: "Light", groupValue: _selectedTheme, onChanged: (value){
          setState(() {
            _selectedTheme = value!;
          });
        }),
        const Text('Light',style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),),
      ],

    );
  }

  Widget buildRatingBar() {
    return RatingBar.builder(
        initialRating: 0.5,
        unratedColor: Colors.blueGrey,
        glowColor: Colors.black87,
        itemCount: 5,
        itemBuilder: (context,_){
          return const Icon(Icons.star_border_purple500_rounded);
        },
        onRatingUpdate: (rating){
          _rating = rating;
        });
  }

  Widget buildSlider() {
    return Slider(
      value: _volume,
      min: 0,
      activeColor: Colors.blueGrey,
      max: 100,
      divisions: 100,
      label: _volume.round().toString(),
      onChanged: (value) {
        setState(() {
          _volume = value;
        });
      },
    );
  }

  Widget buildRowSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Enable Dark Theme',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,fontSize: 16),),
        Switch(
          activeColor: Colors.teal,
          inactiveThumbColor: Colors.blueGrey,
          value: _darkModeEnabled,
          onChanged: (value) {
            setState(() {
              _darkModeEnabled = value;
            });
          },
        ),
      ],
    );
  }
}
