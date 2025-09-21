import 'package:device_sensor_info_app/ui/device_info/view/device_battery_screen.dart';
import 'package:device_sensor_info_app/ui/sensors/view/sensor_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    assert(pages.length == destinations.length);

    return Scaffold(
      appBar: AppBar(title: Text('Device Info & Sensor')),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: destinations,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
      ),
    );
  }

  List<NavigationDestination> get destinations => const [
    NavigationDestination(icon: Icon(Icons.info), label: 'Device'),
    NavigationDestination(icon: Icon(Icons.sensors), label: 'Sensor'),
  ];

  List<Widget> get pages => const [DeviceInfoScreen(), SensorScreen()];
}
