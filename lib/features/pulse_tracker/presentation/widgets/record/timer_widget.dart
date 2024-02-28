import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late CountDownController _controller;

  @override
  void initState() {
    _controller = CountDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _controller.start();
            },
            child: CircularCountDownTimer(
              duration: 60,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              ringColor: Colors.grey[300]!,
              fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              backgroundColor: Theme.of(context).colorScheme.primary,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textFormat: CountdownTextFormat.MM_SS,
              isReverse: true,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: false,
              onStart: () {
                debugPrint('Countdown Started');
              },
              onComplete: () async {
                debugPrint('Countdown Ended');
                await Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    Navigator.pop(context);
                  },
                );
              },
              onChange: (String timeStamp) {
                debugPrint('Countdown Changed $timeStamp');
              },
              timeFormatterFunction: (defaultFormatterFunction, duration) {
                if (duration.inSeconds == 60) {
                  return "Start";
                } else {
                  return Function.apply(defaultFormatterFunction, [duration]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
