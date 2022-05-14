import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  State<FoodTab> createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        _buildListItem('Delicious Hot Dog', 4.0, '6', 'assets/hotdog.png'),
        _buildListItem('Cheese Pizza', 5.0, '126', 'assets/pizza.png')
      ]),
    );
  }

  _buildListItem(String foodName, rating, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 230,
          child: Row(children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: const Color(0xFFFFE3DF),
              ),
              child: Center(
                child: Image.asset(
                  imgPath,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(foodName,
                    style: GoogleFonts.notoSans(
                        fontSize: 14.0, fontWeight: FontWeight.w400)),
                // SmoothStarRating(
                //   allowHalfRating: false,
                //   onRated: (v) {},
                //   starCount: rating.toInt(),
                //   rating: rating,
                //   color: const Color(0xFFFFD143),
                //   borderColor: const Color(0xFFFFD143),
                //   size: 15.0,
                //   spacing: 0.0,
                // )
                Row(
                  children: <Widget>[
                    Text(
                      '\$' + price,
                      style: GoogleFonts.lato(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          textStyle: const TextStyle(color: Color(0xFFF68D7F))),
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      '\$' + '18',
                      style: GoogleFonts.lato(
                          fontSize: 12.0,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w600,
                          textStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.4))),
                    )
                  ],
                )
              ],
            )
          ]),
        ),
        FloatingActionButton(
          onPressed: () {},
          heroTag: foodName,
          mini: true,
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFFFE7D6A),
        )
      ]),
    );
  }
}
