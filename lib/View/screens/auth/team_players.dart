// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kora/Logic/Controllers/tournaments_controller.dart';
//
// class TeamPlayers extends StatelessWidget {
//    TeamPlayers({Key key}) : super(key: key);
//   final controller = Get.find<TournamentsController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers:<Widget> [
//           SliverAppBar(
//             pinned: true,
//             expandedHeight: 200,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text("فريق أبوعريضة"),
//               centerTitle: true,
//             ),
//             actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
//           ),
//           SliverList(delegate: SliverChildListDelegate(getItems(context)))
//         ],
//       ),
//     );
//   }
// }
