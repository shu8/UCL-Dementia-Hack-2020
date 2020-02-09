import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:dementia_hack/quiz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:intl/date_symbol_data_local.dart';
import 'package:path/path.dart' as path;

import 'dart:async';
import 'package:flutter_sound/flutter_sound.dart';

class AudioRecorder extends StatefulWidget {
  @override
  _AudioRecorderState createState() => new _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  bool _isRecording = false;
  bool _isPlaying = false;
  String _path;
  StreamSubscription _recorderSubscription;
  StreamSubscription _dbPeakSubscription;
  StreamSubscription _playerSubscription;
  FlutterSound flutterSound;

  String _recorderTxt = '00:00:00';
  String _playerTxt = '00:00:00';
  double _dbLevel;

  double slider_current_position = 0.0;
  double max_duration = 1.0;

  @override
  void initState() {
    super.initState();
    flutterSound = new FlutterSound();
    flutterSound.setSubscriptionDuration(0.01);
    flutterSound.setDbPeakLevelUpdate(0.8);
    flutterSound.setDbLevelEnabled(true);
    initializeDateFormatting();
  }

  void startRecorder() async {
    try {
      String path = await flutterSound.startRecorder();
      print('startRecorder: $path');

      this.setState(() {
        this._path = path;
      });

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        print(e);
        if (e == null) return;
        DateTime date = new DateTime.fromMillisecondsSinceEpoch(
            e.currentPosition.toInt(),
            isUtc: true);
        String txt = DateFormat('mm:ss:SS', 'pt_BR').format(date);

        this.setState(() {
          this._recorderTxt = txt.substring(0, 8);
        });
      });
      _dbPeakSubscription =
          flutterSound.onRecorderDbPeakChanged.listen((value) {
        print("got update -> $value");
        this.setState(() {
          this._dbLevel = value;
        });
      });

      this.setState(() {
        this._isRecording = true;
      });
    } catch (err) {
      print('startRecorder error: $err');
    }
  }

  void stopRecorder() async {
    try {
      String result = await flutterSound.stopRecorder();
      print('stopRecorder: $result');

      final String newPath = (await getApplicationDocumentsDirectory()).path;
      final String newFileName = Uuid().v4() + path.extension(this._path);
      final File copiedAudio =
          await new File(this._path).copy('$newPath/$newFileName');

      print(copiedAudio.path);

      if (_recorderSubscription != null) {
        _recorderSubscription.cancel();
        _recorderSubscription = null;
      }
      if (_dbPeakSubscription != null) {
        _dbPeakSubscription.cancel();
        _dbPeakSubscription = null;
      }

      this.setState(() {
        this._isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  void startPlayer() async {
    if (this._isPlaying) return;
    String path = await flutterSound.startPlayer(null);
    await flutterSound.setVolume(1.0);
    print('startPlayer: $path');

    try {
      _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
        if (e != null) {
          slider_current_position = e.currentPosition;
          max_duration = e.duration;

          DateTime date = new DateTime.fromMillisecondsSinceEpoch(
              e.currentPosition.toInt(),
              isUtc: true);
          String txt = DateFormat('mm:ss:SS', 'pt_BR').format(date);
          this.setState(() {
            this._isPlaying = true;
            this._playerTxt = txt.substring(0, 8);
          });
        }
      });
    } catch (err) {
      print('error: $err');
    }
  }

  void stopPlayer() async {
    try {
      String result = await flutterSound.stopPlayer();
      print('stopPlayer: $result');
      if (_playerSubscription != null) {
        _playerSubscription.cancel();
        _playerSubscription = null;
      }

      this.setState(() {
        this._isPlaying = false;
      });
    } catch (err) {
      print('error: $err');
    }
  }

  void pausePlayer() async {
    if (!this._isPlaying) return;

    String result = await flutterSound.pausePlayer();
    print('pausePlayer: $result');
    this.setState(() {
      this._isPlaying = false;
    });
  }

  void resumePlayer() async {
    String result = await flutterSound.resumePlayer();
    print('resumePlayer: $result');
  }

  void seekToPlayer(int milliSecs) async {
    String result = await flutterSound.seekToPlayer(milliSecs);
    print('seekToPlayer: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Audio Recorder'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Text(
                  this._recorderTxt,
                  style: TextStyle(
                    fontSize: 48.0,
                    color: Colors.black,
                  ),
                ),
              ),
              _isRecording
                  ? LinearProgressIndicator(
                      value: 100.0 / 160.0 * (this._dbLevel ?? 1) / 100,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      backgroundColor: Colors.red,
                    )
                  : Container()
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 56.0,
                height: 56.0,
                margin: EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  heroTag: 'record',
                  onPressed: () {
                    if (!this._isRecording) {
                      return this.startRecorder();
                    }
                    this.stopRecorder();
                  },
                  child: this._isRecording ? Icon(Icons.stop) : Icon(Icons.mic),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 60.0, bottom: 16.0),
                child: Text(
                  this._playerTxt,
                  style: TextStyle(
                    fontSize: 48.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 56.0,
                height: 56.0,
                margin: EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 'play',
                  onPressed: () {
                    startPlayer();
                  },
                  child: Icon(Icons.play_arrow),
                ),
              ),
              Container(
                width: 56.0,
                height: 56.0,
                margin: EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 'pause',
                  onPressed: () {
                    pausePlayer();
                  },
                  child: Icon(Icons.pause),
                ),
              ),
              Container(
                width: 56.0,
                height: 56.0,
                margin: EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 'stop',
                  onPressed: () {
                    stopPlayer();
                  },
                  child: Icon(Icons.stop),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Container(
              height: 56.0,
              child: Slider(
                  value: slider_current_position,
                  min: 0.0,
                  max: max_duration,
                  onChanged: (double value) async {
                    await flutterSound.seekToPlayer(value.toInt());
                  },
                  divisions: max_duration.toInt()))
        ],
      ),
    );
  }
}
