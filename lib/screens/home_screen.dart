import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/dummy_data.dart';
import 'package:flutter_movies_app_ex/data/models/market_model.dart';
import 'package:flutter_movies_app_ex/data/repository/market_helper.dart';
import 'package:flutter_movies_app_ex/screens/edit_market_screen.dart';
import 'package:flutter_movies_app_ex/screens/market_details_screen.dart';
import 'package:flutter_movies_app_ex/widgets/main_list_item.dart';

import 'add_new_market_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Clothes> clothesList = DUMMY_DATA;

void getRecentlyAdded() {
  List<Clothes> mList = [];
  mList =
      DUMMY_DATA.where((element) => element.size == "RecentlyAdded").toList();
  clothesList = mList;
}

void getMyFavorites() {
  List<Clothes> mList = [];
  mList = DUMMY_DATA.where((element) => element.size == "MyFavorites").toList();
  clothesList = mList;
}

void reset() {
  clothesList = DUMMY_DATA;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Clothes Market'),
      ),
      // drawer: Drawer(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20),
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: 60,
      //         ),
      //         TextButton(
      //           onPressed: () {
      //             setState(() {
      //               getRecentlyAdded();
      //             });
      //           },
      //           child: Text('Recently Added'),
      //         ),
      //         Divider(),
      //         TextButton(
      //           onPressed: () {
      //             setState(() {
      //               getMyFavorites();
      //             });
      //           },
      //           child: Text('My Favorites'),
      //         ),
      //         Divider(),
      //         TextButton(
      //           onPressed: () {
      //             setState(() {
      //               reset();
      //             });
      //           },
      //           child: Text('Reset'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, index) {
          var clothes = clothesList[index];
          return Dismissible(
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                ClothesDetailsScreen.routeName,
                arguments: clothes,
              ),
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  EditClothesScreen.routeName,
                  arguments: {"clothes": clothes, "index": index},
                ).then((_) {
                  setState(() {});
                });
              },
              child: MainListItem(
                  imageUrl: clothes.imageUrl,
                  title: clothes.name,
                  size: clothes.size,
                  price: clothes.price),
            ),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) => showDialog(
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
                          Navigator.pop(context);
                        });
                      },
                      child: Text("YES"))
                ],
              ),
            ),
          );
        },
        itemCount: clothesList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AddNewClothesScreen.routeName)
                .then((_) {
          setState(() {});
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}
