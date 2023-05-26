import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_chara.dart';
import 'list_weapon.dart';
import 'package:praktpm_preresponsi_123200049/model/selected_weapon.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
    Widget build(BuildContext context) {
      final selectedWeapon = Provider.of<SelectedWeapon>(context).selectedWeapon;
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 150),
                        child: Image.asset(
                          'assets/genshin_logo.png',
                          width: 480,
                        ),
                      ),
                      if (selectedWeapon != null) ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, // Background color of the button
                                foregroundColor: Colors.white, // Text color of the button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    // Display the selected weapon's icon
                                    Image.network(
                                      'https://api.genshin.dev/weapons/${selectedWeapon.name}/icon',
                                      width: 50,
                                      height: 50,
                                    ),
                                    const SizedBox(height: 10),
                                    // Display the selected weapon's name
                                    Text(selectedWeapon.name,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          width: 220,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ListChara()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey, // Background color of the button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                              child: Text(
                                'Character',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Text color of the button
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 60,
                          width: 220,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ListWeapon()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey, // Background color of the button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                              child: Text(
                                'Weapon',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Text color of the button
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
      );
    }
  }
