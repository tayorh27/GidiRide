import 'package:firebase_database/firebase_database.dart';
import 'package:gidi_ride/Models/fares.dart';
import 'package:gidi_ride/Models/favorite_places.dart';
import 'package:gidi_ride/Models/general_promotion.dart';
import 'package:gidi_ride/Models/payment_method.dart';

class CurrentTrip {
  String id,
      trip_distance,
      trip_duration,
      vehicle_type,
      scheduled_date,
      status,
      created_date,
      price_range,
      trip_total_price,
      assigned_driver;
  FavoritePlaces current_location, destination;
  PaymentMethods payment_method;
  GeneralPromotions promotion;
  bool card_trip, promo_used;
  Fares fare;

  CurrentTrip.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.value['id'].toString();
    current_location =
        FavoritePlaces.fromJson(snapshot.value['current_location']);
    destination = FavoritePlaces.fromJson(snapshot.value['destination']);
    trip_distance = snapshot.value['trip_distance'].toString();
    trip_duration = snapshot.value['trip_duration'].toString();
    payment_method = (snapshot.value['card_trip'])
        ? PaymentMethods.fromJson(snapshot.value['payment_method'])
        : null;
    vehicle_type = snapshot.value['vehicle_type'].toString();
    promotion = (snapshot.value['promo_used'])
        ? GeneralPromotions.fromJson(snapshot.value['promotion'])
        : null;
    card_trip = snapshot.value['card_trip'];
    promo_used = snapshot.value['promo_used'];
    scheduled_date = snapshot.value['scheduled_date'];
    status = snapshot.value['status'].toString();
    created_date = snapshot.value['created_date'].toString();
    price_range = snapshot.value['price_range'].toString();
    trip_total_price = snapshot.value['trip_total_price'].toString();
    fare = Fares.fromJson(snapshot.value['fare']);
    assigned_driver = snapshot.value['assigned_driver'].toString();
  }
}
