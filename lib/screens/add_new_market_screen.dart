import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/market_model.dart';
import 'package:flutter_movies_app_ex/data/repository/market_helper.dart';
import 'package:flutter_movies_app_ex/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AddNewClothesScreen extends StatelessWidget {
  static const routeName = "/add-new-movie";

  final _formKey = GlobalKey<FormState>();

  TextEditingController clothesID = TextEditingController();
  TextEditingController clothesName = TextEditingController();
  TextEditingController clothesDescription = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController clothesUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Add new clothes'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: clothesID,
                    decoration: InputDecoration(hintText: "Please enter id"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid id";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesName,
                    decoration: InputDecoration(hintText: "Please enter name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid name";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesUrl,
                    decoration: InputDecoration(hintText: "Please enter url"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid url";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesDescription,
                    decoration:
                        InputDecoration(hintText: "Please enter description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid description";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: size,
                    decoration: InputDecoration(hintText: "Please enter size"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid size";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: price,
                    decoration: InputDecoration(hintText: "Please enter price"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid price";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Clothes clothes = Clothes(
                            id: int.parse(clothesID.text),
                            name: clothesName.text,
                            imageUrl: clothesUrl.text,
                            description: clothesDescription.text,
                            size: size.text,
                            price: double.parse(price.text),
                          );

                          ClothesRepository().addClothes(
                              clothes.id,
                              clothes.name,
                              clothes.imageUrl,
                              clothes.description,
                              clothes.size,
                              clothes.price);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                          // Navigator.pop(context);
                        }
                      },
                      child: Text("Add"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
