import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/model/quote.dart';
import 'package:quotes/provider/quotes_provider.dart';
import 'circle_icon.dart';
import 'package:quotes/widget/tag.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final index;
  final favourite;
  QuoteCard(
      {@required this.quote, @required this.index, this.favourite = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        final quote =
                            Provider.of<QuotesProvider>(context, listen: false);
                        quote.removeQuote(index);
                      },
                      child: Text('X',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey)),
                    ),
                  ],
                )),
            Text(quote.content, style: Theme.of(context).textTheme.bodyText1),
            Text('- ${quote.author}',
                style: Theme.of(context).textTheme.subtitle1),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Wrap(
                direction: Axis.horizontal,
                children: quote.tags
                    .map((tag) => Tag(
                          title: tag,
                        ))
                    .toList()
                    .cast<Widget>(),
              ),
            ),
            favourite
                ? Transform.translate(
                    offset: Offset(-5, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleIcon(
                          index: index,
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 20,
                  )
          ],
        ),
      ),
    );
  }
}
