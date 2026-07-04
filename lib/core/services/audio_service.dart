import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _sendPlayer = AudioPlayer();
  final AudioPlayer _receivePlayer = AudioPlayer();

  Future<void> init() async {
    await _sendPlayer.setSource(AssetSource('sounds/send.m4a'));
    await _receivePlayer.setSource(AssetSource('sounds/recieve.m4a'));
  }

  Future<void> playSendSound() async {
    await _sendPlayer.stop();
    await _sendPlayer.resume();
  }

  Future<void> playReceiveSound() async {
    await _receivePlayer.stop();
    await _receivePlayer.resume();
  }

  void dispose() {
    _sendPlayer.dispose();
    _receivePlayer.dispose();
  }
}
