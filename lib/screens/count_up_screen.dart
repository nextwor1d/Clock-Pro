// ignore_for_file: avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CountUpTimerScreen extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => CountUpTimerScreen(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<CountUpTimerScreen> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onEnded: () {
      print('onEnded');
    },
  );

  final _scrollController = ScrollController();

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data!;
              final displayTime =
                  StopWatchTimer.getDisplayTime(value, hours: _isHours);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      displayTime,
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),

          // Lap time.
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 340,
              width: 200,
              child: StreamBuilder<List<StopWatchRecord>>(
                stream: _stopWatchTimer.records,
                initialData: _stopWatchTimer.records.value,
                builder: (context, snap) {
                  final value = snap.data!;
                  if (value.isEmpty) {
                    return SizedBox.shrink();
                  }
                  Future.delayed(Duration(milliseconds: 100), () {
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeOut);
                  });
                  print('Listen records. $value');
                  return ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      final data = value[index];
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              '${index + 1} ${data.displayTime}',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            height: 1,
                          )
                        ],
                      );
                    },
                    itemCount: value.length,
                  );
                },
              ),
            ),
          ),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.play_arrow),
                iconSize: 50,
                onPressed: _stopWatchTimer.onStartTimer,
              ),
              IconButton(
                icon: Icon(Icons.pause),
                iconSize: 50,
                onPressed: _stopWatchTimer.onStopTimer,
              ),
              IconButton(
                icon: Icon(Icons.restore),
                iconSize: 50,
                onPressed: _stopWatchTimer.onResetTimer,
              ),
              IconButton(
                icon: Icon(Icons.playlist_add),
                iconSize: 50,
                onPressed: _stopWatchTimer.onAddLap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
