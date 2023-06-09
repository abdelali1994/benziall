import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleCartItem extends StatefulWidget {
  const SingleCartItem({super.key});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(color: Colors.red, width: 2.3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: Colors.red.withOpacity(0.5),
              child: Image.network(
                  "https://www.transparentpng.com/thumb/laptop/9oRuDc-refreshed-pavilion-gaming-series-launching-next-month.png"),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              // height: 140,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Laptop",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                if (qty >= 1) {
                                  setState(() {
                                    qty--;
                                  });
                                }
                              },
                              padding: EdgeInsets.zero,
                              child: const CircleAvatar(
                                maxRadius: 13.0,
                                child: Icon(Icons.remove),
                              ),
                            ),
                            Text(
                              qty.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                setState(() {
                                  qty++;
                                });
                              },
                              padding: EdgeInsets.zero,
                              child: const CircleAvatar(
                                maxRadius: 13.0,
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: const Text(
                            " Add To wishlist",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      " 123dh",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // color: Color.fromARGB(255, 81, 56, 54).withOpacity(0.5),
            ),
          ),
          // Image.network(
          //     "https://www.transparentpng.com/thumb/laptop/9oRuDc-refreshed-pavilion-gaming-series-launching-next-month.png"),
        ],
      ),
    );
  }
}
