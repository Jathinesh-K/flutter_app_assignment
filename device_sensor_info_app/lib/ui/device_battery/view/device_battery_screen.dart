import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/device_battery_view_model.dart';

class DeviceBatteryScreen extends StatelessWidget {
  const DeviceBatteryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DeviceBatteryViewModel>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: viewModel.getBatteryLevel,
            child: const Text('Get Battery Level'),
          ),
          Consumer<DeviceBatteryViewModel>(
            builder: (context, viewModel, _) {
              return Text(viewModel.batteryLevel);
            }
          )
        ],
      ),
    );
  }
}
