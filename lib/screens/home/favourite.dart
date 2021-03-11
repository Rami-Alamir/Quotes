import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/provider/quotes_provider.dart';
import 'package:quotes/utilities/behavior.dart';
import 'package:quotes/widget/quote_card.dart';
import 'package:quotes/widget/spinkit_indicator.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    final quote = Provider.of<QuotesProvider>(context, listen: false);
    quote.getFavouriteQuotes();
  }

  @override
  Widget build(BuildContext context) {
    final _quote = Provider.of<QuotesProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ScrollConfiguration(
        behavior: Behavior(),
        child:
            CustomScrollView(controller: _scrollController, slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios,
                          color: Theme.of(context).primaryColor, size: 30))
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _quote.favouriteQuotesList.length,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (BuildContext ctxt, int index) {
                    return QuoteCard(
                        index: index,
                        quote: _quote.favouriteQuotesList[index],
                        favourite: false);
                  }),
            ),
          ])),
          SliverPadding(
            padding: EdgeInsets.all(20),
          )
        ]),
      ),
    );
  }
}
