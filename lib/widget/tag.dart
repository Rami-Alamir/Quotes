import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final title;
  const Tag({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(
              color: Colors.black45,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
            child: Text(
              '#$title',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline2,
              maxLines: 1,
            ),
          )),
    );
  }
}
