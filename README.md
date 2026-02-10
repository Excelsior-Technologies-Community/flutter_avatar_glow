# ✨ Custom AvatarGlow (Flutter)

A dependency-free Flutter AvatarGlow animation built from scratch with
AnimationController.
Includes a demo screen and optional audio recording integration.

Perfect for:

🎤 Voice recording UI

📞 Calling / ringing indicator

🟢 Online status highlight

👤 Profile attention animation
---

## ✨ Features

🌈 Smooth glowing animation

⏱ Custom animation duration

📏 Configurable glow radius

🎨 Custom glow color

🔁 Repeat or single animation

⏸ Start / stop animation dynamically

🚫 No third-party animation packages

📦 Library-ready structure 

---

## ✨ Preview






https://github.com/user-attachments/assets/2e75e02b-988e-46ef-a42b-ae59a08959d0




---

## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  custom_avatar_glow:
    path: ../custom_avatar_glow

```
▶️ From GitHub
```
dependencies:
  custom_avatar_glow:
    git:
      url: https://github.com/yourusername/custom_avatar_glow.git

```
Then Run:
```
flutter pub get
```
## 📁 Folder Structure
```
lib/
│
├── widgets/
│   └── custom_avatar_glow.dart
│
├── screens/
│   └── avatar_glow_demo_screen.dart

  ```
# Optional: Audio Recording Support
```
dependencies:
  record: ^6.2.0

```

## 🚀 Usage (Demo App)


```
import 'package:flutter/material.dart';
import 'package:custom_avatar_glow/custom_avatar_glow.dart';

class UserDemoScreen extends StatefulWidget {
  const UserDemoScreen({super.key});

  @override
  State<UserDemoScreen> createState() => _UserDemoScreenState();
}

class _UserDemoScreenState extends State<UserDemoScreen> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AvatarGlow User Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🎤 Avatar Glow Usage
            CustomAvatarGlow(
              animate: isRecording,
              glowColor: Colors.red,
              startRadius: 45,
              endRadius: 90,
              duration: const Duration(seconds: 2),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.mic,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// ▶️ Control Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isRecording = !isRecording;
                });
              },
              child: Text(
                isRecording ? 'Stop Recording' : 'Start Recording',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
