import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/provider/quotes_provider.dart';
import 'package:quotes/utilities/behavior.dart';
import 'package:quotes/utilities/routing_constants.dart';
import 'package:quotes/widget/quote_card.dart';
import 'package:quotes/widget/spinkit_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    final quote = Provider.of<QuotesProvider>(context, listen: false);
    quote.getQuoteData(context);
    quote.getDB(context);
  }

  @override
  Widget build(BuildContext context) {
    final _quote = Provider.of<QuotesProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _quote.isLoading
          ? SpinkitIndicator()
          : ScrollConfiguration(
              behavior: Behavior(),
              child: RefreshIndicator(
                color: Color.fromRGBO(106, 20, 191, 1),
                onRefresh: () async {
                  await _quote.getQuoteData(context);
                },
                child: CustomScrollView(
                    controller: _scrollController,
                    slivers: <Widget>[
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('quotes',
                                  style: Theme.of(context).textTheme.headline1),
                              IconButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed(FAVOURITE),
                                  icon: Icon(Icons.favorite_outline,
                                      color: Theme.of(context).primaryColor,
                                      size: 30))
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
                              itemCount: _quote.quotesList.length,
                              padding: EdgeInsets.all(0),
                              itemBuilder: (BuildContext ctxt, int index) {
                                return QuoteCard(
                                    index: index,
                                    quote: _quote.quotesList[index]);
                              }),
                        ),
                      ])),
                      SliverPadding(
                        padding: EdgeInsets.all(20),
                      )
                    ]),
              ),
            ),
    );
  }
}
