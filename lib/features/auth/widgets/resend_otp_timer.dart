import 'dart:async';

import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:flutter/material.dart';

class ResendOTPTimer extends StatefulWidget {
  const ResendOTPTimer({Key? key}) : super(key: key);

  @override
  State<ResendOTPTimer> createState() => _ResendOTPTimerState();
}

class _ResendOTPTimerState extends State<ResendOTPTimer> {
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 59);
  @override
  void initState() {
    super.initState();
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(
      () => countdownTimer!.cancel(),
    );
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(
      () => myDuration = Duration(seconds: 59),
    );
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(
      () {
        final seconds = myDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer!.cancel();
        } else {
          myDuration = Duration(seconds: seconds);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(59));

    return Column(
      children: [
        // ElevatedButton(
        //   onPressed: startTimer,
        //   child: Text(
        //     'Start',
        //     style: TextStyle(
        //       fontSize: 30,
        //     ),
        //   ),
        // ),
        // // Step 10
        // ElevatedButton(
        //   onPressed: () {
        //     if (countdownTimer == null || countdownTimer!.isActive) {
        //       stopTimer();
        //     }
        //   },
        //   child: Text(
        //     'Stop',
        //     style: TextStyle(
        //       fontSize: 30,
        //     ),
        //   ),
        // ),
        // // Step 11
        // ElevatedButton(
        //     onPressed: () {
        //       resetTimer();
        //     },
        //     child: Text(
        //       'Reset',
        //       style: TextStyle(
        //         fontSize: 30,
        //       ),
        //     )),
        SkModernistText(
          text: '00:$seconds',
          fontWeight: FontWeight.w700,
          size: Dimensions.font10 * 3.4,
        ),
      ],
    );
  }
}
