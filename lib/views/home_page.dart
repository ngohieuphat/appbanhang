import 'package:banhang/bloc/data_bloc.dart';
import 'package:banhang/bloc/data_event.dart';
import 'package:banhang/bloc/data_state.dart';
import 'package:banhang/controller/controller.dart';
import 'package:banhang/views/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(114, 166, 56, 144),
        body: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
          // datainitialState trang thai ban dau
          if (state is DataInitialState) {
            context.read<DataBloc>().add(LoadDataEvent());
            // tra lai center va bao vong tron va chi bao tien trinh
            return const Center(
              child: CircularProgressIndicator(),
            );
            // neu nhu trang thai dataloadingState
          } else if (state is DataLoadingState) {
            // tra lai center va bao vong tron va chi bao tien trinh
            return const Center(
              child: CircularProgressIndicator(),
            );
            //trang thai dataloadedstate tra ve homeview
          } else if (state is DataLoadedState) {
            return HomeView();
          } else if (state is DataErrorState) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          return const Center(
            child: Text('Unexpected Error'),
          );
        }),
      ),
    );
  }

  Widget HomeView() {
    return Obx(() => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        suffixIcon: const Icon(Icons.search),
                        hintText: 'Find the desired product',
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18))),
                  )),
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: .6,
              shrinkWrap: true,
              children: List.generate(controller.groceryList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(DetailPage(
                        index: index,
                      ));
                    },
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
                                          padding:
                                              EdgeInsets.only(left: 3, top: 1),
                                          child: Text(
                                            controller
                                                .groceryList[index].productName
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
                                              child: Text('Purchase',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'HindSiliguri',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11,
                                                      color: Colors.black)),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 1),
                                                child: Text(
                                                  "€"
                                                  '${controller.groceryList[index].charge.sellingPrice.toString()}',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 1),
                                              child: Text(
                                                  "€"
                                                  '${controller.groceryList[index].charge.sellingPrice - 8}',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
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
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8)),
                                            Text(
                                                "€"
                                                '${controller.groceryList[index].charge.sellingPrice.toString()}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text('Profit',
                                                style: TextStyle(
                                                    fontFamily: 'HindSiliguri',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8)),
                                            Text(
                                                "€"
                                                '${controller.groceryList[index].charge.profit.toString()}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .lineThrough)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                controller.groceryList[index].stock != 0
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
                                      icon: Icon(Icons.add_circle,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                      ],
                    ),
                  ),
                );
              }),
            )),
            Container(
              height: 20,
            )
          ],
        ));
  }
}
