import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okbhaiya/main.dart';

import 'package:okbhaiya/models/Category.dart';
import 'package:okbhaiya/models/businessUser.dart';
import 'package:okbhaiya/models/picture.dart';
import 'package:okbhaiya/provider/AuthenticationProvider.dart';

import 'package:okbhaiya/screen/Navigation/Navigation.dart';
import 'package:okbhaiya/screen/SuccessScreen.dart';

import 'package:okbhaiya/widget/Category.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  User user;
  String title;
  Register({
    Key? key,
    required this.user,
    required this.title,
  }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isLoading = false;
  bool isSuccess = false;
  late Category selectCategory;
  final TextEditingController name = TextEditingController();
  final TextEditingController businessNmae = TextEditingController();
  final TextEditingController busimessCategory = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    businessNmae.dispose();
    busimessCategory.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !isSuccess
        ? Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (name.text.isNotEmpty &&
                    businessNmae.text.isNotEmpty &&
                    // ignore: unnecessary_null_comparison
                    selectCategory != null) {
                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(Duration(milliseconds: 500), () {
                    handleSubmit(context);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please fill this form'),
                  ));
                }
              },
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 1,
              child: isLoading
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )
                  : Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.label_important,
                  color: Theme.of(context).indicatorColor,
                ),
                onPressed: () {},
              ),
              // ignore: deprecated_member_use
              backwardsCompatibility: false,

              title: Text(widget.title,
                  style: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              elevation: 1,
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                        autofocus: true,
                        controller: name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          focusColor: Colors.teal[800],
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).indicatorColor),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 16, bottom: 0, right: 0, top: 20),
                          hintText: 'Your Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                        controller: businessNmae,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.store),
                          focusColor: Colors.teal[800],
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).indicatorColor),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 16, bottom: 0, right: 0, top: 20),
                          hintText: 'Business Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                        controller: busimessCategory,
                        readOnly: true,
                        onTap: () => showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            isScrollControlled: true,
                            context: context,
                            builder: (context) =>
                                showCategory(context, setState)),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          focusColor: Colors.teal[800],
                          suffixIcon: Icon(busimessCategory.text.isEmpty
                              ? Icons.arrow_drop_down
                              : Icons.close),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).indicatorColor),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 16, bottom: 0, right: 16, top: 0),
                          hintText: 'Business Category ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )
        : SuccessScreen(
            user: widget.user,
          );
  }

  showCategory(BuildContext context, Function setState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: StreamBuilder<List<Category>>(
              builder: (context, snapshot) {
                final data = snapshot.data;

                if (data != null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GridView.builder(
                      itemCount: data.length,
                      // scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (data[index].featured == true) {
                              setState(() {
                                selectCategory = data[index];
                                busimessCategory.text = selectCategory.name;
                              });

                              Navigator.pop(context);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'Try Another ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content:
                                      Text('This category is not available'),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ButtonTheme(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Theme.of(context)
                                                    .primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30), // <-- Radius
                                                )),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Ok')),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                          child: Material(
                            child: CategoryView(
                              key: UniqueKey(),
                              category: data[index],
                            ),
                          ),
                        );
                      },
                      physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              stream: context.read(dataProvider).getAllCategory()),
        ),
      ],
    );
  }

  void handleSubmit(BuildContext context) {
    context
        .read(authServiceProvider)
        .register(BusinessUser(
            businessName: businessNmae.text,
            category: [selectCategory.id],
            coverlink: [],
            geo: Geo(lat: 0, lng: 0),
            id: widget.user.uid,
            logoLink: Pic(downloadUrl: '', filename: '', path: ''),
            phoneNumber: widget.user.phoneNumber.toString(),
            user: name.text,
            type: selectCategory.type))
        .then((value) => {
              setState(() {
                isSuccess = true;
              }),
              Future.delayed(Duration(milliseconds: 3000), () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NavitionRoute(
                    user: widget.user,
                  ),
                ));
              })
            });
    setState(() {
      isLoading = false;
    });
  }
}
