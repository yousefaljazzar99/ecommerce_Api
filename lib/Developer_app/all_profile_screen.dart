import 'package:ecommerce_api/AirLine_App/provider/AirLineProvider.dart';
import 'package:ecommerce_api/AirLine_App/view/widget/Passengers_widget.dart';
import 'package:ecommerce_api/Developer_app/developer_provider.dart';
import 'package:ecommerce_api/Developer_app/dio_helper.dart';
import 'package:ecommerce_api/Developer_app/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
        centerTitle: true,
      ),
      body: Consumer<DeveloperProvider>(
        builder: (context, provider, x) {
          return LazyLoadScrollView(
            onEndOfPage: () {
              provider.getAllProfile();
            },
            child: ListView.builder(
                itemCount: provider.profile.length,
                itemBuilder: ((context, index) {
                  return ProfileWidget(provider.profile[index]);
                })),
          );
        },
      ),
    );
  }
}
