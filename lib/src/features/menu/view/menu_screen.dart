//
//
//
//
//
// class MenuScreen extends StatelessWidget {
//   const MenuScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("My First App"),
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               HorizontalScrollMenu(),
//               ListView.builder(
//                   itemCount: MenuData.sections.length,
//                   itemBuilder: (BuildContext context, int i) {
//                     return Container(
//                       child: Column(
//                         children: [
//                            Text(
//                             MenuData.sections[i],
//                             textAlign: TextAlign.left,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Roboto',
//                               fontSize: 32,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 180,
//                                 height: 196,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(16),
//                                   color: Colors.white,
//                                 ),
//                                 child: ListView.builder(
//                                   itemCount: MenuData.products[i].length,
//                                   itemBuilder: (BuildContext context, int j) {
//                                     return Column(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Image(image: NetworkImage(MenuData.productImages[i]), height: 100,),
//                                         Text(
//                                           MenuData.products[i][j],
//                                           style: const TextStyle(
//                                             color: Colors.black,
//                                             fontFamily: 'Roboto',
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                         TextButton(
//                                             onPressed: () {},
//                                             style: TextButton.styleFrom(
//                                               foregroundColor: Colors.white,
//                                               backgroundColor: AppColors.buyButtonColor,
//                                             ),
//                                             child: Text(MenuData.productsCost[i][j])
//                                         ),
//                                       ],
//                                     );
//                                   }
//                                 )
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   }
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class Main extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (int i = 0; i < MenuData.sections.length; i++) {
//           Column(
//             children: [
//               const Text(
//                 MenuData.sections[i],
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'Roboto',
//                   fontSize: 32,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 180,
//                     height: 196,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         for (int j = 0; i < MenuData.products[j]; j++) {
//                           Image(image: NetworkImage(MenuData.productImages[i]), height: 100,),
//                           const Text(
//                             MenuData.products[i][j],
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Roboto',
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           TextButton(
//                               onPressed: () {},
//                               style: TextButton.styleFrom(
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: AppColors.buyButtonColor,
//                               ),
//                               child: Text(MenuData.productsCost[i][j]);
//                           ),
//                         },
//                       ],
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           )
//         },
//       ],
//     )
//   }
// }



class HorizontalScrollMenu extends StatelessWidget {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0, // Установите фиксированную высоту
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue,
            child: Center(
              child: Text(
                items[index],
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          );
        },
      ),
    );
  }
}