import 'package:flutter/material.dart';

class blank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blank page'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(1, (index) {
          return InkWell(
            onTap: () {
              Navigator.pop(context, '/${index + 1}');
            },
            child: Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'back',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
