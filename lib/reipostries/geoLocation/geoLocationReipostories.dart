import 'package:geolocator/geolocator.dart';
import 'package:wishy/reipostries/geoLocation/basegeo_Location_repo.dart';

class GeolocationRepository extends BaseGeloloctionRepository{
  GeolocationRepository();

  @override
  Future<Position> getCurrentLocation() async{
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);


  }
}