import 'package:banhang/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  //goi controller getx
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
            child: Scaffold(
          backgroundColor: Colors.lightBlueAccent.shade100,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Form(
                    //che do xac thuc autovalidatemode tuong tac vs ng dung
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          suffixIcon: Icon(Icons.search),
                          hintText: 'Find the desired product',
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    )),
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 6,
                shrinkWrap: true,
                children: List.generate(
                  controller.groceryList.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        height: 280,
                                        width: 170,
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Column(
                                          children: [
                                            Image.network(controller
                                                .groceryList[index].image),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3, top: 1),
                                              child: Text(
                                                controller.groceryList[index]
                                                    .productName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                                maxLines: 2,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3, top: 1),
                                                  child: Text('ক্রয়',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'HindSiliguri',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                          color: Colors.black)),
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 1),
                                                    child: Text(
                                                      "৳"
                                                      '${controller.groceryList[index].charge.sellingPrice.toString()}',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 1),
                                                  child: Text(
                                                      "৳"
                                                      '${controller.groceryList[index].charge.sellingPrice - 8}',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('Sale',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'HindSiliguri',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10)),
                                                Text(
                                                    "৳"
                                                    '${controller.groceryList[index].charge.sellingPrice.toString()}',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text('Profit',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'HindSiliguri',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10)),
                                                Text(
                                                    '€'
                                                    '${controller.groceryList[index].charge.profit.toString()}',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    //stock luong hang = 0
                                    // khong = 0 neu dk do la dung

                                    controller.groceryList[index].stock != 0
                                        // =0 dat n o 1 vi tri gan o dau ma~
                                        ? Container()
                                        : Positioned(
                                            right: 10,
                                            bottom: 130,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                child: Container(
                                                  height: 30,
                                                  width: 70,
                                                  color: Colors.red.shade200,
                                                  child: Center(
                                                      child: Text(
                                                    "Not in stock",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                                ))),
                                  ],
                                )
                              ],
                            ),
                            //neu =0 co nghia la san pham co san co 1 nut co the them san pham vao gio hang
                            controller.groceryList[index].stock == 0
                                ? Container()
                                : Positioned(
                                    right: 60,
                                    top: 258,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        color: Colors.black,
                                        height: 45,
                                        width: 45,
                                        child: IconButton(
                                          onPressed: () {
                                            print("Added");
                                          },
                                          // chuyen sang tien ich obx
                                          icon: Icon(Icons.add_circle,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ))
            ],
          ),
        )));
  }
}
