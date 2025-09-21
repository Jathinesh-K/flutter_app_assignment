import 'package:device_sensor_info_app/data/services/device_info_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repositories/device_info_repository_impl.dart';
import '../domain/repositories/device_info_repository.dart';
import '../ui/device_info/view_model/device_battery_view_model.dart';

List<SingleChildWidget> get providers => [
  Provider<DeviceInfoService>(
    create: (context) => DeviceInfoServiceImpl() as DeviceInfoService,
  ),
  Provider<DeviceInfoRepository>(
    create: (context) =>
        DeviceInfoRepositoryImpl(context.read()) as DeviceInfoRepository,
  ),
  ChangeNotifierProvider(
    create: (context) =>
        DeviceInfoViewModel(deviceInfoRepository: context.read()),
  ),
];
