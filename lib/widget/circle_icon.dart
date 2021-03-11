import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/provider/quotes_provider.dart';

class CircleIcon extends StatelessWidget {
  final int index;

  const CircleIcon({@required this.index});

  @override
  Widget build(BuildContext context) {
    final quote = Provider.of<QuotesProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        quote.updateIsFavouriteQuote(index);
      },
      child: Card(
        elevation: 6,
        shape:
            CircleBorder(side: BorderSide(width: 1, color: Colors.transparent)),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(122, 46, 197, 1),
                Color.fromRGBO(106, 20, 191, 1)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.transparent),
          ),
          child: Icon(quote.quotesList[index].isFavourite == 0
              ? Icons.favorite_border_outlined
              : Icons.favorite_outlined),
        ),
      ),
    );
  }
}
