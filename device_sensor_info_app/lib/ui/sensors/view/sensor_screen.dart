import 'package:device_sensor_info_app/ui/sensors/view_model/sensor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<SensorViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ?child,
              const SizedBox(height: 16),
              Icon(
                viewModel.flashlightEnabled
                    ? Icons.flashlight_on
                    : Icons.flashlight_off,
                color: viewModel.flashlightEnabled
                    ? Colors.amber
                    : Colors.grey,
              ),
              const SizedBox(height: 16),
              if (!viewModel.hasFlashlight)
                const Text('No flashlight available for this device')
              else
                FilledButton(
                  onPressed: viewModel.isFlashlightLoading
                      ? null
                      : viewModel.toggleFlashlight,
                  child: Text(
                    viewModel.flashlightEnabled ? 'Turn Off' : 'Turn On',
                  ),
                ),
            ],
          );
        },
        child: const Text('Flashlight'),
      ),
    );
  }
}
