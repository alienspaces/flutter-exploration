import 'package:flutter/material.dart';

// import 'scaffold.dart';
// import 'tutorial.dart';
// import 'shopping_list.dart';
// import 'layout_tutorial.dart';
// import 'cookbook_animated_route.dart';
// import 'cookbook_draggable_card.dart';
import 'cookbook_animated_container.dart';

// Shopping List.
// void main() {
//   runApp(MaterialApp(
//     title: 'Shopping App',
//     home: ShoppingList(
//       products: <Product>[
//         Product(name: 'Laser Pistol'),
//         Product(name: 'EMP Grenade'),
//         Product(name: 'Stympack'),
//       ],
//     ),
//   ));
// }

// Layout Tutorial.
// void main() {
//   runApp(MaterialApp(
//     title: 'Shopping App',
//     home: LayoutTutorial(),
//   ));
// }

// Cookbook Animated Route
// void main() {
//   runApp(MaterialApp(
//     home: Page1(),
//   ));
// }

// Cookbook Physics Card.
void main() {
  runApp(MaterialApp(
    home: AnimatedContainerApp(),
  ));
}
