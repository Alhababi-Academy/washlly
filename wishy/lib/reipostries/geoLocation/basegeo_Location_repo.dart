import 'package:geolocator/geolocator.dart';

abstract class BaseGeloloctionRepository{
  Future<Position?> getCurrentLocatoin() async{}
}