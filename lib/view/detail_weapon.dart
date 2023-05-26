import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailWeapon extends StatefulWidget {
  final String name;

  DetailWeapon({required this.name});

  @override
  _DetailWeaponState createState() => _DetailWeaponState();
}

class _DetailWeaponState extends State<DetailWeapon> {
  Map<String, dynamic>? weaponData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeaponData();
  }

  Future<void> fetchWeaponData() async {
    try {
      final response = await http.get(Uri.parse('https://api.genshin.dev/weapons/${widget.name}'));
      if (response.statusCode == 200) {
        setState(() {
          weaponData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load weapon data. Error: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Failed to load weapon data. Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail ${weaponData!['name']}',
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
      )
          : weaponData != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        'https://api.genshin.dev/weapons/${widget.name}/icon',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        weaponData!['name'],
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            weaponData!['rarity'],
                                (index) => Icon(
                              Icons.star,
                              color: Colors.blueGrey,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Base Attack: ${weaponData!['baseAttack']}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
          : Center(
              child: Text('Failed to load weapon data.'),
      ),
    );
  }
}
