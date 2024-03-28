import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/src/features/menu/data/data_buy_products.dart';
import 'package:flutter_course/src/features/menu/data/data_functions.dart';
import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/data/styles.dart';
import 'package:flutter_course/src/features/menu/models/drink_model.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  String _getBuySum(BuildContext context) {
    var dataProducts = Provider.of<DataBuyProducts>(context).data;
    double sum = 0.0;

    for (DrinkModel item in dataProducts) {
      sum += double.parse(item.price.price);
    }

    return sum.toStringAsFixed(2);
  }

  void _showBottomSheet(BuildContext context) {
    var dataProducts = Provider.of<DataBuyProducts>(context, listen: false);
    var products = dataProducts.data;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  height: 24,
                  alignment: Alignment.center,
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                SizedBox(
                    height: 52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ваш заказ',
                          style: TextStyles.titleOfBottomSheet,
                        ),
                        IconButton(
                            onPressed: () {
                              dataProducts.clearProductData();
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.restore_from_trash))
                      ],
                    )),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: products.length,
                    separatorBuilder: (context, _) => SizedBox(height: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 75,
                        child: Row(
                          children: [
                            Image(
                              image: NetworkImage(products[index].img),
                              // Возвращаем картинку напитка
                              height: 55,
                              width: 55,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Image(
                                  image: AssetImage(
                                      'lib/src/assets/images/outdata_image.jpg'),
                                  height: 55,
                                  width: 55,
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    products[index].name,
                                    style: TextStyles.subtitle,
                                  ),
                                  Text(
                                    '${products[index].price.price}₽',
                                    style: TextStyles.priceInBottomSheet,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(133, 195, 222, 1),
                      foregroundColor: Colors.white,
                      alignment: Alignment.center,
                      minimumSize: Size(double.infinity, 56),
                    ),
                    onPressed: () async {
                      bool flagStatus = await MenuProductRepository.postDataInServer(DataFunctions.countingPurchases(products));
                      if (flagStatus) {
                        dataProducts.clearProductData(); //чистим корзину
                        Navigator.pop(context); // Закрываем BottomSheet
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text(
                              'Заказ создан',
                              style: TextStyles.textInBottomSheet,
                            ),
                          )
                        );
                      } else {
                        Navigator.pop(context); // Закрываем BottomSheet
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Возникла ошибка при заказе',
                                style: TextStyles.textInBottomSheet,
                              ),
                            )
                        );
                      }
                    },
                    child: const Text(
                      'Оформить заказ',
                      style: TextStyles.textInBottomSheet,
                    ),
                  ),

              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 45,
      child: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        backgroundColor: Color.fromRGBO(133, 195, 222, 1),
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag_outlined),
            Text('${_getBuySum(context)}₽'),
          ],
        ),
      ),
    );
  }
}
