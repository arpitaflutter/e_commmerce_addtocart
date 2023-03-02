import 'package:e_commmerce_addtocart/home/model/home_model.dart';
import 'package:e_commmerce_addtocart/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  TextEditingController txtid = TextEditingController();

  TextEditingController txtname1 = TextEditingController();
  TextEditingController txtstd1 = TextEditingController();
  TextEditingController txtid1 = TextEditingController();

  home_provider? h1;
  @override
  Widget build(BuildContext context) {

    h1 = Provider.of<home_provider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ecommerce app",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  hintText: "Name:",
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: txtstd,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  hintText: "Std:",
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: txtid,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  hintText: "ID:",
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(onPressed: () {
                stdModel s1 = stdModel(name: txtname.text,id: txtid.text,std: txtstd.text);

                h1?.add_data(s1);
              },
                  style: ElevatedButton.styleFrom(),
                  child: Text("Add")),
              Consumer<home_provider>(
                builder: (context, value, child) => Expanded(
                  child: ListView.builder(
                    itemCount: h1?.l1.length,
                    itemBuilder: (context, index) =>
                      ListTile(
                        leading: Text("${h1?.l1[index].id}"),
                        title: Text("${h1?.l1[index].name}"),
                        subtitle: Text("${h1?.l1[index].std}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                              h1?.delet_data(index);
                            }, icon: Icon(Icons.delete,color: Colors.red,)),
                            IconButton(onPressed: () {

                              txtname1 = TextEditingController(text: "${h1!.l1[index].name}");
                              txtid1 = TextEditingController(text: "${h1!.l1[index].id}");
                              txtstd1 = TextEditingController(text: "${h1!.l1[index].std}");

                              showDialog(context: context, builder: (context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: txtname1,
                                    ),
                                    TextField(
                                      controller: txtstd1,
                                    ),
                                    TextField(
                                      controller: txtid1,
                                    ),
                                    ElevatedButton(onPressed: () {

                                      stdModel s1 = stdModel(std: txtstd1.text,id: txtid1.text,name: txtname1.text);
                                      h1!.edit_data(index, s1);

                                      Navigator.pop(context);
                                    }, child: Text("Edit"))
                                  ],
                                ),
                              ),);
                            }, icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
