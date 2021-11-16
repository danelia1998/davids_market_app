import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/market_model.dart';
import 'package:flutter_movies_app_ex/data/repository/market_helper.dart';
import 'package:flutter_movies_app_ex/screens/home_screen.dart';

class ClothesDetailsScreen extends StatefulWidget {
  static const routeName = "/details-screen";

  @override
  State<ClothesDetailsScreen> createState() => _ClothesDetailsScreenState();
}

class _ClothesDetailsScreenState extends State<ClothesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Clothes clothes =
        ModalRoute.of(context)!.settings.arguments as Clothes;
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Are you sure?"),
                    content: Text("Do you really want to delete this clothes?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("NO"),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              ClothesRepository().removeClothes(clothes.id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()));
                            });
                          },
                          child: Text("YES"))
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.delete,
                size: 26.0,
              ),
            ))
      ]),
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                    ),
                    Container(
                      width: 350,
                      height: 300,
                      child: Image.network(clothes.imageUrl),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Name:"), Text(clothes.name)]),
                    Container(
                      width: 18,
                      height: 18,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Price:"),
                          Text(clothes.price.toString())
                        ]),
                    Container(
                      width: 18,
                      height: 18,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Size:"), Text(clothes.size)]),
                    Container(
                      width: 18,
                      height: 18,
                    ),
                  ],
                ),
                Text(clothes.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
