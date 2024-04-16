import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/controllers/downloads_controller.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class ControlPlayAudioForDownloads extends StatelessWidget {
  const ControlPlayAudioForDownloads({
    super.key,
    required this.controller,
  });

  final DownloadsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 85,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondary.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(width: 1, color: context.theme.primaryColor),
        ),
      ),
      child: ListTile(
        onLongPress: () => controller.unSelectSura(),
        leading: CircleAvatar(
          backgroundColor: context.theme.primaryColor,
          child: const Icon(Icons.audiotrack_rounded),
        ),
        title: Text(
          "${controller.selectedSura?.name}",
        ),
        subtitle: SizedBox(
          // height: 35,
          child: controller.player.builderRealtimePlayingInfos(
            builder: (context, info) {
              return PositionSeekWidget(
                currentPosition: info.currentPosition,
                duration: info.duration,
                seekTo: (to) {
                  controller.player.seek(to);
                },
              );
            },
          ),
        ),
        trailing: controller.playing
            ? IconButton(
                icon: const Icon(Icons.pause_rounded),
                onPressed: () {
                  controller.resumeOrPause();
                },
              )
            : IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  controller.resumeOrPause();
                },
              ),
      ),
    );
  }
}

class PositionSeekWidget extends StatefulWidget {
  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;

  const PositionSeekWidget({
    super.key,
    required this.currentPosition,
    required this.duration,
    required this.seekTo,
  });

  @override
  _PositionSeekWidgetState createState() => _PositionSeekWidgetState();
}

class _PositionSeekWidgetState extends State<PositionSeekWidget> {
  late Duration _visibleValue;
  bool listenOnlyUserInterraction = false;
  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PositionSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInterraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Slider(
                    thumbColor: context.theme.primaryColor,
                    activeColor: context.theme.primaryColor.withOpacity(0.9),
                    inactiveColor: context.theme.primaryColor.withOpacity(0.5),
                    min: 0,
                    max: widget.duration.inMilliseconds.toDouble(),
                    value: percent * widget.duration.inMilliseconds.toDouble(),
                    onChangeEnd: (newValue) {
                      setState(() {
                        listenOnlyUserInterraction = false;
                        widget.seekTo(_visibleValue);
                      });
                    },
                    onChangeStart: (_) {
                      setState(() {
                        listenOnlyUserInterraction = true;
                      });
                    },
                    onChanged: (newValue) {
                      setState(() {
                        final to = Duration(milliseconds: newValue.floor());
                        _visibleValue = to;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                child: Text(durationToString(widget.currentPosition)),
              ),
              SizedBox(
                width: 40,
                child: Text(durationToString(widget.duration)),
              ),
            ],
          ),
          // const SizedBox(height: 50),
        ],
      ),
    );
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  final twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  final twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return '$twoDigitMinutes:$twoDigitSeconds';
}
