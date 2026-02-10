import 'package:flutter/material.dart';
import 'package:flutter_avatar_glow/avatar_glow/custom_avatar_glow.dart';

class AvatarGlowDemoScreen extends StatefulWidget {
  const AvatarGlowDemoScreen({super.key});

  @override
  State<AvatarGlowDemoScreen> createState() => _AvatarGlowDemoScreenState();
}

class _AvatarGlowDemoScreenState extends State<AvatarGlowDemoScreen> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom AvatarGlow Demo'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 🎤 Mic Glow Example
          CustomAvatarGlow(
            animate: isRecording,
            glowColor: Colors.red,
            endRadius: 90,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.red,
              child: const Icon(Icons.mic, color: Colors.white, size: 30),
            ),
          ),

          const SizedBox(height: 40),

          /// ▶️ Start / Stop Button
          ElevatedButton.icon(
            icon: Icon(isRecording ? Icons.stop : Icons.mic),
            label: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
            onPressed: () {
              setState(() {
                isRecording = !isRecording;
              });
            },
          ),
        ],
      ),
    );
  }
}
