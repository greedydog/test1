

import 'package:flutter_test_project/pages/music_play_page/music_play_page.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'notifiers/play_button_notifier.dart';
import 'notifiers/progress_notifier.dart';
import 'notifiers/repeat_button_notifier.dart';
import 'page_manager.dart';
import 'services/service_locator.dart';

/////////////////////////////로직 분리 및 주석처리
// class AudioFile extends StatefulWidget {
//   final AudioPlayer musicPlayer;
//   const AudioFile({super.key, required this.musicPlayer});
//
//   @override
//   State<AudioFile> createState() => _AudioFileState();
// }
//
// class _AudioFileState extends State<AudioFile> {
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//   String path = "rr.mp3";
//   bool isPlaying = false;
//   bool isPaused = false;
//   bool isLoop = false;
//
//
//   재생중인 시간, 남은 재생시간
//   String formatTime(int seconds) {
//     int minutes = Duration(seconds: seconds).inMinutes;
//     int remainingSeconds = seconds - (minutes * 60);
//
//     return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
//   }
//
//   Future<void> saveState() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('last_position', position.inSeconds);
//     await prefs.setString('last_path', path);
//     // 재생 상태도 저장 합니다.
//     await prefs.setBool('is_playing', isPlaying);
//   }
//
//   Future<void> loadState() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedPosition = prefs.getInt('last_position') ?? 0;
//     final savedPath = prefs.getString('last_path') ?? 'default_path.mp3';
//     // 재생 상태를 로드 합니다.
//     final savedIsPlaying = prefs.getBool('is_playing') ?? false;
//     // 로드된 정보를 기반으로 오디오 플레이어 설정
//     setState(() {
//       position = Duration(seconds: savedPosition);
//       path = savedPath;
//       // 재생 상태를 설정합니다.
//       isPlaying = savedIsPlaying;
//     });
//     await musicPlayer.setSource(AssetSource(savedPath));
//
//     // await musicPlayer.setSource(UrlSource(savedPath)); 웹url
//
//     if (isPlaying) {
//       musicPlayer.play(UrlSource(savedPath));
//       musicPlayer.seek(Duration(seconds: savedPosition));
//     }
//   }
  /////////////////////////////로직 분리 끝



  //주석처리
  // initState
  // @override
  // void initState() {
  //   super.initState();
  //   musicPlayer.onPlayerStateChanged.listen((state) {
  //     setState(() {
  //       isPlaying = state == PlayerState.playing;
  //     });
  //   });
  //
  //   musicPlayer.onDurationChanged.listen((nuwDuration) {
  //     setState(() {
  //       duration = nuwDuration;
  //     });
  //   });
  //
  //   musicPlayer.onPositionChanged.listen((newPosition) {
  //     setState(() {
  //       position = newPosition;
  //     });
  //   });
  //
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     loadState();
  //   });
  // }
  //
  // IconData playIcon = Icons.play_arrow;
  // List<IconData> _icons = [
  //   Icons.play_arrow,
  //   Icons.pause,
  // ];
  //
  // @override
  // void dispose() {
  //   // 현재 상태를 저장합니다.
  //   saveState();
  //   // 오디오 플레이어를 정리합니다.
  //   musicPlayer.dispose();
  //   super.dispose();
  // }
// 주석 끝



// UI 수정 및 추가 main.dart import
// export되는 이름 파악 및 코드 수정
// AudioDrive(musicPlayer) async {
//   await setupServiceLocator();
//   MyApp(musicPlayer);
// }



// Future<void> main() async {
//   final musicPlayer = AudioPlayer(); // Assuming AudioPlayer is a class
//   await AudioDrive(musicPlayer);
// }

// Future AudioDrive(AudioPlayer musicPlayer) async {
//   runApp(MyApp(musicPlayer));
// }




class AudioDrive extends StatefulWidget {
  const AudioDrive(AudioPlayer musicPlayer, {super.key});

  @override
  State<AudioDrive> createState() => _MyAppState();

}

class _MyAppState extends State<AudioDrive> {
  @override
  void initState() {
    super.initState();

    getIt<PageManager>().init();
  }

  @override
  void dispose() {
    getIt<PageManager>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              CurrentSongTitle(),
              // Playlist(),
              // AddRemoveSongButtons(),
              AudioProgressBar(),
              AudioControlButtons(),
            ],
      ),
    );
  }
}

class CurrentSongTitle extends StatelessWidget {
  const CurrentSongTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: pageManager.currentSongTitleNotifier,
      builder: (_, title, __) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(title, style: const TextStyle(fontSize: 40)),
        );
      },
    );
  }
}


//주석처리
// class Playlist extends StatelessWidget {
//   const Playlist({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final pageManager = getIt<PageManager>();
//     return Expanded(
//       child: ValueListenableBuilder<List<String>>(
//         valueListenable: pageManager.playlistNotifier,
//         builder: (context, playlistTitles, _) {
//           return ListView.builder(
//             itemCount: playlistTitles.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(playlistTitles[index]),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

//
// // 주석처리
// class AddRemoveSongButtons extends StatelessWidget {
//   const AddRemoveSongButtons({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final pageManager = getIt<PageManager>();
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             onPressed: pageManager.add,
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: pageManager.remove,
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: pageManager.seek,
        );
      },
    );
  }
}

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          RepeatButton(),
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),
          ShuffleButton(),
        ],
      ),
    );
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<RepeatState>(
      valueListenable: pageManager.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.off:
            icon = const Icon(Icons.repeat, color: Colors.grey);
            break;
          case RepeatState.repeatSong:
            icon = const Icon(Icons.repeat_one);
            break;
          case RepeatState.repeatPlaylist:
            icon = const Icon(Icons.repeat);
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: pageManager.repeat,
        );
      },
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: (isFirst) ? null : pageManager.previous,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: const CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 32.0,
              onPressed: pageManager.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 32.0,
              onPressed: pageManager.pause,
            );
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: (isLast) ? null : pageManager.next,
        );
      },
    );
  }
}

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return IconButton(
          icon: (isEnabled)
              ? const Icon(Icons.shuffle)
              : const Icon(Icons.shuffle, color: Colors.grey),
          onPressed: pageManager.shuffle,
        );
      },
    );
  }
}

///////////////////////////////////main import 끝




//UI 로직 분석 및 스타일 섞기

// Widget btnStart

// Widget loadAsset

// Widget Build




  // Widget btnStart() {
  //   return Container(
  //     width: 60,
  //     height: 60,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(50), color: Colors.black45),
  //     child: IconButton(
  //         icon: Icon(
  //           isPlaying == false ? _icons[0] : _icons[1],
  //           size: 45,
  //           color: Colors.white,
  //         ),
  //         onPressed: () async {
  //           if (isPlaying == false) {
  //             musicPlayer.play(AssetSource(path));
  //             setState(() {
  //               isPlaying = true;
  //             });
  //           } else if (isPlaying == true) {
  //             musicPlayer.pause();
  //             setState(() {
  //               isPlaying = false;
  //             });
  //           }
  //         }),
  //   );
  // }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:

            const [
              RepeatButton(),
              PreviousSongButton(),
              PlayButton(),
              NextSongButton(),
              ShuffleButton(),
            ],

          // Container(
          //     width: 60,
          //     height: 60,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25),
          //         color: Colors.transparent),
          //     child: IconButton(
          //         icon: Icon(
          //           Icons.swap_horiz_outlined,
          //           size: 35,
          //           color: Colors.white,
          //         ),
          //         onPressed: () {})),
          // Container(
          //     width: 60,
          //     height: 60,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25),
          //         color: Colors.transparent),
          //     child: IconButton(
          //         icon: Icon(
          //           Icons.skip_previous,
          //           size: 35,
          //           color: Colors.white,
          //         ),
          //         onPressed: () {})),
          // btnStart(),
          // Container(
          //     width: 60,
          //     height: 60,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25),
          //         color: Colors.transparent),
          //     child: IconButton(
          //         icon: Icon(
          //           Icons.skip_next,
          //           size: 35,
          //           color: Colors.white,
          //         ),
          //         onPressed: () {})),
          // Container(
          //     width: 60,
          //     height: 60,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25),
          //         color: Colors.transparent),
          //     child: IconButton(
          //         icon: Icon(
          //           Icons.loop,
          //           size: 35,
          //           color: Colors.white,
          //         ),
          //         onPressed: () {})),


      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Slider(
  //             activeColor: Colors.black54,
  //             inactiveColor: Colors.black38,
  //             min: 0,
  //             max: duration.inSeconds.toDouble(),
  //             value: position.inSeconds.toDouble(),
  //             onChanged: (value) {
  //               final position = Duration(seconds: value.toInt());
  //               musicPlayer.seek(position);
  //               musicPlayer.resume();
  //
  //               final newPosition = Duration(seconds: value.toInt());
  //               musicPlayer.seek(newPosition);
  //               // 상태 저장
  //               saveState();
  //             }),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "  " + formatTime(position.inSeconds),
  //               style: TextStyle(fontSize: 18),
  //             ),
  //             Text(
  //               formatTime((duration - position).inSeconds) + "  ",
  //               style: TextStyle(fontSize: 18),
  //             )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         loadAsset(),
  //       ],
  //     ),
  //   );
  // }
// }