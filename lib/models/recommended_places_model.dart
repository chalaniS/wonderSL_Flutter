//for recommended places
//import 'dart:convert';
//import 'package:http/http.dart' as htpp;

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecommendedPlaceModel {
  final String image;
  final double rating;
  final String location;
  RecommendedPlaceModel({
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    image: "assets/places/kandy-1.jpg",
    rating: 4.4,
    location: "kandy Tooth Relic, Kandy",
  ),
  RecommendedPlaceModel(
    image: "assets/places/Anuradhapura-1.jpg",
    rating: 4.4,
    location: "Ruwanweli seya, Anuradhapura",
  ),
  RecommendedPlaceModel(
    image: "assets/places/Galle-1.jpg",
    rating: 4.4,
    location: "Galle Fort",
  ),
  RecommendedPlaceModel(
    image: "assets/places/nuwaraeliya.jpg",
    rating: 4.4,
    location: "Nuwara Eliya",
  ),
  RecommendedPlaceModel(
    image: "assets/places/Polonnaruwa.jpg",
    rating: 4.4,
    location: "Polonnaruwa",
  ),
];
