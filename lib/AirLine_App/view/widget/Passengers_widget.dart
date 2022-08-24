import 'package:ecommerce_api/AirLine_App/models/passengerResponse.dart';
import 'package:flutter/material.dart';

class passengerWidget extends StatelessWidget {
  Passengers passengers;
  passengerWidget(this.passengers);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey.withOpacity(0.2),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.network(
              passengers.airline?.first.logo ?? '',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(passengers.name ?? ''),
              Text(passengers.trips.toString()),
            ],
          )
        ],
      ),
    );
  }
}
