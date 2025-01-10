import 'package:get_it/get_it.dart';
import 'package:abhiyanth/services/size_config.dart';
GetIt locator = GetIt.instance;
final sizeConfig = locator<SizeConfig>();

setUpLocator()
{
  locator.registerSingleton(SizeConfig());
}