
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/me/bloc/me_bloc.dart';
import '../../features/media_devices/bloc/media_devices_bloc.dart';
import '../../features/peers/bloc/peers_bloc.dart';
import '../../features/producers/bloc/producers_bloc.dart';
import '../../features/room/bloc/room_bloc.dart';

List<BlocProvider> getRoomModules({
  required String roomId,
  required String userId,
  required String displayName,
}) {
  return [
    BlocProvider<ProducersBloc>(
      lazy: false,
      create: (context) => ProducersBloc(),
    ),
    BlocProvider<PeersBloc>(
      lazy: false,
      create: (context) => PeersBloc(
        mediaDevicesBloc: context.read<MediaDevicesBloc>(),
      ),
    ),
    BlocProvider<MeBloc>(
      lazy: false,
      create: (context) => MeBloc(
        displayName: displayName,
        id: userId,
      ),
    ),
    BlocProvider<RoomBloc>(
      lazy: false,
      create: (context) => RoomBloc(roomId),
    ),
  ];
}
