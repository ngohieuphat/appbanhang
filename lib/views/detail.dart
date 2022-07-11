import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.index}) : super(key: key);
  int index;
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    String description = controller.groceryList[index].description;
    return Obx(() => Scaffold(
          backgroundColor: Color.fromARGB(235, 162, 173, 9),
          appBar: AppBar(
            title: const Text(
              "Product Details",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),
            automaticallyImplyLeading: true,
            backgroundColor: Color.fromARGB(113, 87, 97, 5),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 0, left: 0, top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: TextFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
                                suffixIcon: const Icon(Icons.search),
                                hintText: 'Find the desired product',
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(13),
                                  bottomRight: Radius.circular(13),
                                )),
                            height: 200,
                            width: 50,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                                color: Colors.white,
                                width: 220,
                                height: 270,
                                child: Image.network(
                                  controller.groceryList[index].image,
                                )),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(13),
                                  bottomLeft: Radius.circular(13),
                                )),
                            height: 200,
                            width: 50,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(controller.groceryList[index].productName.toString(),
                          style: const TextStyle(
                              fontFamily: 'HindSiliguri',
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            const Text("Brand :",
                                style: TextStyle(
                                    fontFamily: 'HindSiliguri', fontSize: 14)),
                            Text(
                                controller.groceryList[index].brand.name
                                    .toString(),
                                style: const TextStyle(
                                    fontFamily: 'HindSiliguri',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.adjust_rounded,
                              size: 15,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("Distributor :",
                                style: TextStyle(
                                    fontFamily: 'HindSiliguri', fontSize: 14)),
                            Expanded(
                              child: Text(
                                controller.groceryList[index].seller.toString(),
                                style: const TextStyle(
                                    fontFamily: 'HindSiliguri',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                                maxLines: 1,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(13),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text('Purchase price',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.red)),
                                            Text(
                                                "€"
                                                '${controller.groceryList[index].charge.sellingPrice.toString()}',
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text('Sale price',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)),
                                            Text(
                                              "€"
                                              '${controller.groceryList[index].charge.currentCharge.toString()}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        const DottedLine(
                                          direction: Axis.horizontal,
                                          dashGapLength: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text('Profit',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17)),
                                            Text(
                                              "€"
                                              '${controller.groceryList[index].charge.profit.toString()}',
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Text("Details",
                                          style: TextStyle(
                                              fontFamily: 'HindSiliguri',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15)),
                                    ),
                                    Html(data: description, style: {
                                      "span": Style(
                                          color: Colors.black,
                                          backgroundColor: Colors.white,
                                          fontSize: FontSize.medium),
                                    }),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Positioned(
                              top: 75,
                              left: 158,
                              child: GestureDetector(
                                onTap: () {
                                  print("Buy it");
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Colors.yellow.shade600,
                                      width: 65,
                                      height: 65,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "It is",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Buy",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
