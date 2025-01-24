import 'package:abhiyanth/services/notification_service.dart';
import 'package:abhiyanth/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/services/user_service.dart';
GetIt locator = GetIt.instance;
final sizeConfig = locator<SizeConfig>();
final userService=locator<UserService>();
final notificationServices=locator<NotificationServices>();

setUpLocator()
{
  locator.registerSingleton(SizeConfig());
  locator.registerSingleton(NotificationServices());
  locator.registerSingleton(UserService());
}