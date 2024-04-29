import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call/features/media_devices/ui/MediaDeviceSelector.dart';

import '../bloc/media_devices_bloc.dart';

class AudioInputSelector extends StatelessWidget {
  const AudioInputSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MediaDeviceInfo> audioInputDevices = context.select((MediaDevicesBloc bloc) => bloc.state.audioInputs);
    final MediaDeviceInfo? selectedAudioInput =
        context.select((MediaDevicesBloc bloc) => bloc.state.selectedAudioInput);

    return MediaDeviceSelector(
      selected: selectedAudioInput,
      options: audioInputDevices,
      onChanged: (MediaDeviceInfo? device) => context.read<MediaDevicesBloc>().add(
            MediaDeviceSelectAudioInput(device),
          ),
    );
  }
}
