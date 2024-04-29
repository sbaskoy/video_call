import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_modules/app_modules.dart';

import 'features/me/bloc/me_bloc.dart';
import 'features/media_devices/bloc/media_devices_bloc.dart';
import 'features/peers/bloc/peers_bloc.dart';
import 'features/producers/bloc/producers_bloc.dart';
import 'features/room/bloc/room_bloc.dart';
import 'features/signaling/room_client_repository.dart';
import 'screens/room/room.dart';
import 'screens/room/room_modules.dart';

class DeviceLoadWidget extends StatelessWidget {
  const DeviceLoadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<MediaDevicesBloc>(),
      builder: (context, state) {
        if (state is MediaDevicesLoadedState) {
          return const Room();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class VideoCallRoom extends StatelessWidget {
  final String roomId;
  final String userId;
  final String displayName;
  final String serverUrl;

  const VideoCallRoom(
      {super.key, required this.roomId, required this.userId, required this.displayName, required this.serverUrl});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...getAppModules(),
        ...getRoomModules(displayName: displayName, roomId: roomId, userId: userId),
      ],
      child: RepositoryProvider(
        lazy: false,
        create: (context) {
          return RoomClientRepository(
            peerId: userId,
            displayName: displayName,
            serverUrl: serverUrl,
            roomId: roomId,
            peersBloc: context.read<PeersBloc>(),
            producersBloc: context.read<ProducersBloc>(),
            meBloc: context.read<MeBloc>(),
            roomBloc: context.read<RoomBloc>(),
            mediaDevicesBloc: context.read<MediaDevicesBloc>(),
          )..join();
        },
        child: const DeviceLoadWidget(),
      ),
    );
  }
}
