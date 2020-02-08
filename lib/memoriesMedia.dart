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
          title: Text('Add media for memories'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                    title: 'Add Photos',
                    // height: 150.0,
                    icon: Icons.photo,
                    description: '',
                    color: Colors.green,
                    clickHandler: () => moveScreen(context, () => AddPhoto()),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                    title: 'Add Video',
                    // height: 160.0,
                    icon: Icons.videocam,
                    description: '',
                    color: Colors.orange,
                    clickHandler: () => {print('TODO')}, // TODO moveScreen
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Panel(
                    title: 'Add Audio',
                    icon: Icons.keyboard_voice,
                    // height: 160.0,
                    description: '',
                    color: Colors.red[200],
                    clickHandler: () => {print('TODO')}, // TODO moveScreen
                  )),
            ],
          ),
        ));
  }
}
