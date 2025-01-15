import 'package:delivery_app/helper/api.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/models/user_info_model.dart';
import 'package:delivery_app/providers/userinfo_provider.dart';
import 'package:delivery_app/services/get_orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfoModel? userInfoModel =
        Provider.of<UserinfoProvider>(context).userInfoModel;
    return FutureBuilder<List<Product>>(
        future: GetOrders().getOrder(token: userInfoModel!.token),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                Product order = orders[index];
                DateTime date = timeParse(order.updated_at);
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 130,
                    child: Card(
                      color: Colors.grey.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '${Api().image}${order.image}',
                              width: 80,
                              height: 85,
                              fit: BoxFit.fill,
                            ),
                          ),
                          //Text('${order.image}'),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${order.name}',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    'date order : ${date.day}-${date.month}-${date.year}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'time order : ${date.hour}:${date.minute}:${date.second}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    'price : ${order.price}',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              // child: CircularProgressIndicator(),
              child: Text(
                'No Orders Yet !',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            );
          }
        });
  }
}

DateTime timeParse(String? dateTime) {
  DateTime date = DateTime.parse(dateTime!);
  return date;
}
