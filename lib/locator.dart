import 'package:abhiyanth/services/notification_service.dart';
import 'package:get_it/get_it.dart';
import 'package:abhiyanth/services/size_config.dart';
GetIt locator = GetIt.instance;
final sizeConfig = locator<SizeConfig>();
final notificationServices=locator<NotificationServices>();
setUpLocator()
{
  locator.registerSingleton(SizeConfig());
  locator.registerSingleton(NotificationServices());
}