part of 'room_bloc.dart';

class RoomState extends Equatable {
  final String? activeSpeakerId;
  final String? state;
  final String roomId;
  const RoomState({this.activeSpeakerId, this.state, required this.roomId});

  RoomState newActiveSpeaker({
    String? activeSpeakerId,
  }) {
    return RoomState(roomId: roomId, state: state, activeSpeakerId: activeSpeakerId);
  }

  @override
  List<Object?> get props => [activeSpeakerId, state, roomId];
}
