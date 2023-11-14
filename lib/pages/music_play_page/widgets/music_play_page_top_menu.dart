import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/cubit/app_cubits.dart';
// import 'package:flutter_test_project/pages/music_play_page/audio_bloc/audio_bloc.dart';

class MusicPlayPageTopMenu extends StatelessWidget {
  const MusicPlayPageTopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: MediaQuery.of(context).size.width - 20,
        left: 10,
        top: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                //
                // final audioPlayerBloc =
                //     BlocProvider.of<AudioPlayerBloc>(context);
                //
                // // 현재 음악 재생 상태에 따라 다른 동작을 수행할 수 있습니다.
                // // 예를 들어, 음악이 재생 중이면 일시 정지를 할 수 있습니다.
                // if (audioPlayerBloc.state.isPlaying) {
                //   audioPlayerBloc.add(PauseAudio());
                // }

                Navigator.pop(context);
              },
              icon: Icon(
                Icons.west,
                size: 30,
              ),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<AppCubits>(context).goHome();
              },
              icon: Icon(
                Icons.more_vert,
                size: 30,
              ),
              color: Colors.white,
            )
          ],
        ));
  }
}
