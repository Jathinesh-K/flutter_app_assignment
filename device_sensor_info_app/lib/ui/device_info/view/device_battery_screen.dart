import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../view_model/device_battery_view_model.dart';

class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DeviceInfoViewModel>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Consumer<DeviceInfoViewModel>(
                builder: (context, viewModel, _) {
                  final deviceInfo = viewModel.deviceInfo;

                  if (viewModel.isLoading) {
                    return Lottie.asset('assets/loading_animation.json');
                  } else if (deviceInfo == null) {
                    return Text('Click the below button to get Device Info');
                  } else {
                    return Column(
                      children: [
                        ListTile(
                          title: Text('Device Name'),
                          subtitle: Text(deviceInfo.deviceName),
                        ),
                        ListTile(
                          title: Text('OS Version'),
                          subtitle: Text(deviceInfo.osVersion),
                        ),
                        ListTile(
                          title: Text('Battery Level'),
                          subtitle: Text('${deviceInfo.batteryLevel}%'),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: viewModel.getDeviceInfo,
              child: const Text('Get Device Info'),
            ),
          ),
        ],
      ),
    );
  }
}
