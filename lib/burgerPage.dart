// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerPage extends StatefulWidget {
  final imgPath, foodName, pricePerItem, heroTag;

  const BurgerPage(
      {Key? key, this.imgPath, this.foodName, this.pricePerItem, this.heroTag})
      : super(key: key);

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netPrice = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.black),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFE7D6A).withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: const Offset(0.0, 4.0),
                          )
                        ],
                        color: const Color(0xFFFE7D6A),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: GoogleFonts.notoSans(
                                fontSize: 7.0,
                                textStyle:
                                    const TextStyle(color: Color(0xFFFE7D6A))),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.foodName.toString().toUpperCase(),
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(widget.imgPath),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6.0,
                                spreadRadius: 6.0,
                                offset: Offset(5.0, 11.0),
                              )
                            ]),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            size: 25.0,
                            color: Color(0xFFFE7D6A),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Stack(
                    children: [
                      Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6.0,
                                spreadRadius: 6.0,
                                offset: Offset(5.0, 11.0),
                              )
                            ]),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.restore,
                            size: 25.0,
                            color: Color(0xFFFE7D6A),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 70,
                  width: 150,
                  child: Center(
                      child: Text(
                          '\$' +
                              (int.parse(widget.pricePerItem) * quantity)
                                  .toString(),
                          style: GoogleFonts.notoSans(
                            fontSize: 40.0,
                            color: Color(0xFF5E6166),
                            fontWeight: FontWeight.w500,
                          )))),
              Container(
                height: 60,
                width: 225,
                decoration: BoxDecoration(
                    color: Color(0xFFFeD7D6A),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              adjustQuantity('MINUS');
                            },
                            iconSize: 17,
                            icon: Icon(
                              Icons.remove,
                              color: Color(0xFFFE7D6A),
                            )),
                        Text(
                          quantity.toString(),
                          style: GoogleFonts.notoSans(
                              fontSize: 14.0,
                              color: Color(0xFFFE7D6A),
                              fontWeight: FontWeight.w400),
                        ),
                        IconButton(
                            onPressed: () {
                              adjustQuantity('PLUS');
                            },
                            iconSize: 17,
                            icon: Icon(
                              Icons.add,
                              color: Color(0xFFFE7D6A),
                            )),
                      ]),
                    ),
                    Text(
                      'Add to cart',
                      style: GoogleFonts.notoSans(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'FEATURED',
              style: GoogleFonts.notoSans(
                  fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            height: 225,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('1'),
                _buildListItem('2'),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListItem(String columnNumber) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          if (columnNumber == '1')
            _buildColumnItem(
                'assets/cheese.png', 'Sweet cheese', '11', Color(0xFFFBD6F5)),
          if (columnNumber == '1') SizedBox(height: 15.0),
          if (columnNumber == '1')
            _buildColumnItem(
                'assets/popcorn.png', 'Sweet popcorn', '11', Color(0xFFFBD6F5)),
          if (columnNumber == '2')
            _buildColumnItem(
                'assets/taco.png', 'Tacos', '6', Color(0xFFC2E3FE)),
          if (columnNumber == '2') SizedBox(height: 15.0),
          if (columnNumber == '2')
            _buildColumnItem(
                'assets/sandwich.png', 'Sandwich', '6', Color(0xFFD7FADA)),
        ],
      ),
    );
  }

  _buildColumnItem(
      String imgPath, String foodName, String price, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 210,
          child: Row(children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: bgColor,
              ),
              child: Center(
                  child: Image.asset(imgPath, height: 50.0, width: 50.0)),
            ),
            SizedBox(width: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(foodName,
                  style: GoogleFonts.notoSans(
                      fontSize: 14.0, fontWeight: FontWeight.w400)),
              Text(
                '\$' + price,
                style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    textStyle: TextStyle(color: Color(0xFFF68D7F))),
              ),
            ])
          ]),
        )
      ],
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}
