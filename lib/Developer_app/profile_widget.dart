import 'package:ecommerce_api/AirLine_App/models/passengerResponse.dart';
import 'package:ecommerce_api/Developer_app/profile_responce.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileResponce profile;
  ProfileWidget(this.profile);
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
              profile.user!.avatar ?? '',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(profile.user!.name ?? ''),
              Text(profile.status!),
              Text(profile.skills.toString()),
              Text(profile.location!),
              Text(profile.website!),
              Text(profile.company!),
            ],
          )
        ],
      ),
    );
  }
}
