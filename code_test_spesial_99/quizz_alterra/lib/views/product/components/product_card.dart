import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String category;
  final int price;
  final String seller;
  final int sold;
  final IconData icon;
  final void Function()? onTap;
  const ProductCard(
      {super.key,
      required this.name,
      required this.category,
      required this.price,
      required this.seller,
      required this.sold,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(44, 4, 0, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 109, 20),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child:  Icon(
                        icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 17.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        Text(category,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54))
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp',
                        decimalDigits: 0,
                      ).format(price),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          seller + ' | ',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ),
                        Text(
                          sold.toString() + ' Terjual',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5,),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 18),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(44, 4, 0, 1),
                borderRadius: BorderRadius.circular(14),
              ),
            child: const Icon(Icons.delete, size: 30,color: Color.fromARGB(255, 222, 21, 7),)),
        )
      ],
    );
  }
}
