import 'package:device_sensor_info_app/data/repositories/device_info_repository_impl.dart';
import 'package:device_sensor_info_app/data/services/device_info_service.dart';
import 'package:device_sensor_info_app/ui/device_battery/view/device_battery_screen.dart';
import 'package:device_sensor_info_app/ui/device_battery/view_model/device_battery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/repositories/device_info_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => DeviceBatteryViewModel(
            deviceInfoRepository:
                DeviceInfoRepositoryImpl(DeviceInfoService())
                    as DeviceInfoRepository,
          ),
          child: DeviceBatteryScreen(),
        ),
      ),
    );
  }
}
