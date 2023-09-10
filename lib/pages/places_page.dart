import 'dart:convert';

import 'package:http/http.dart' as http;

final apiKey =
    'AIzaSyDcrCvVdhcMIPmnXVL_0Ltt7d7bU1s9DK8'; // Replace with your API key
final placeId =
    'YOUR_PLACE_ID'; // Replace with the place ID you want to retrieve details for

final url = Uri.parse('https://maps.googleapis.com/maps/api/place/details/json'
    '?place_id=$placeId'
    '&fields=name,formatted_address,photo,rating,opening_hours'
    '&key=$apiKey');

void getPlaceDetails() async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    // Parse the response JSON to get place details
    final data = json.decode(response.body);
    final result = data['result'];

    final name = result['name'];
    final address = result['formatted_address'];
    final photoUrl = result['photo']; // You can handle photos separately
    final rating = result['rating'];
    final openingHours = result['opening_hours'];

    // Use the retrieved place details as needed
    print('Name: $name');
    print('Address: $address');
    print('Rating: $rating');

    if (openingHours != null) {
      final isOpen = openingHours['open_now'];
      print('Open now: $isOpen');
    }
  } else {
    // Handle errors
    print('Error fetching place details: ${response.statusCode}');
  }
}

void main() {
  getPlaceDetails();
}
