import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/market_model.dart';
import 'package:flutter_movies_app_ex/data/repository/market_helper.dart';

class EditClothesScreen extends StatefulWidget {
  static const routeName = "/edit-movie-screen";

  @override
  _EditClothesScreenState createState() => _EditClothesScreenState();
}

class _EditClothesScreenState extends State<EditClothesScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController clothesID;
  late TextEditingController clothesName;
  late TextEditingController clothesDescription;
  late TextEditingController size;
  late TextEditingController price;
  late TextEditingController clothesUrl;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Clothes clothes = parsedData["clothes"];
    final int index = parsedData["index"];
    clothesID = TextEditingController(text: clothes.id.toString());
    clothesName = TextEditingController(text: clothes.name);
    clothesDescription = TextEditingController(text: clothes.description);
    size = TextEditingController(text: clothes.size);
    price = TextEditingController(text: clothes.price.toString());
    clothesUrl = TextEditingController(text: clothes.imageUrl);
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Edit clothes'),),
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
                    decoration: InputDecoration(hintText: "Clothes id"),
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
                    decoration: InputDecoration(hintText: "Clothes name"),
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
                    decoration: InputDecoration(hintText: "Clothes url"),
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
                        InputDecoration(hintText: "Clothes description"),
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
                    decoration: InputDecoration(hintText: "Clothes size"),
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
                    decoration: InputDecoration(hintText: "Clothes price"),
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
                          ClothesRepository().editClothes(clothes, index);
                          Navigator.pop(context);
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
