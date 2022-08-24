import 'package:ecommerce_api/AirLine_App/provider/AirLineProvider.dart';
import 'package:ecommerce_api/AirLine_App/view/widget/Passengers_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class PassengersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('passengers'),
        centerTitle: true,
      ),
      body: Consumer<AirLineProvider>(
        builder: (context, provider, x) {
          return LazyLoadScrollView(
            onEndOfPage: () {
              provider.getMorePassengers();
            },
            child: ListView.builder(
                itemCount: provider.isLoading
                    ? provider.passengers.length + 1
                    : provider.passengers.length,
                itemBuilder: ((context, index) {
                  if (index == provider.passengers.length &&
                      provider.isLoading == true) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return passengerWidget(provider.passengers[index]);
                })),
          );
        },
      ),
    );
  }
}
