import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Profile"),
      ),
      body: ListView(
        children: [
          Container(
            child: SizedBox(
              height: 128,
              child: Row(
                children: [
                  Container(
                    height: 128,
                    width: 128,
                    color: Colors.red,
                    child: Center(
                      child: Text("IMAGE"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Darius Calugar",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "Calugar",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "\"Babeș Boyiai\" University",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.surface),
          )
        ],
      ),
    );
  }
}
