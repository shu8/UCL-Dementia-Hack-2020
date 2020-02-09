import 'package:dementia_hack/components/addPhoto.dart';
import 'package:dementia_hack/components/panel.dart';
import 'package:flutter/material.dart';
import 'common.dart';

class MemoriesMediaPage extends StatelessWidget {
  MemoriesMediaPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add media'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                    title: 'Add photos and videos',
                    height: 75,
                    icon: Icons.photo,
                    description: '',
                    color: Colors.green,
                    clickHandler: () => moveScreen(context, () => AddPhoto()),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                    title: 'Add Audio',
                    icon: Icons.keyboard_voice,
                    height: 75,
                    description: '',
                    color: Colors.red[200],
                    clickHandler: () => {print('TODO')}, // TODO moveScreen
                  )),
            ],
          ),
        ));
  }
}
