// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:banhang/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:banhang/main.dart';

void main() {
  test('Fetch Api', () async {
    bool done = false;
    var fetch = (await Repo.getData())?.data!.products.results;
    if (fetch != null) {
      done = true;
    }
    expect(done, true);
  });
}
