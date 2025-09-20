import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class _ChatMessage {
  final String message;
  final bool isUser;
  final String time;
  _ChatMessage({
    required this.message,
    required this.isUser,
    required this.time,
  });
}

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<_ChatMessage> _messages = [];
  final FlutterTts flutterTts = FlutterTts();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _isLoading = false;

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        _ChatMessage(message: text, isUser: true, time: _currentTime()),
      );
      _controller.clear();
      _isLoading = true;
    });

    final gemini = Gemini.instance;
    try {
      final response = await gemini.text(text);

      final reply = response?.output ?? "No response"; // ✅ Extract reply

      setState(() {
        _messages.add(
          _ChatMessage(message: reply, isUser: false, time: _currentTime()),
        );
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _messages.add(
          _ChatMessage(
            message: "Error: $e",
            isUser: false,
            time: _currentTime(),
          ),
        );
        _isLoading = false;
      });
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print("STATUS: $val"),
        onError: (val) => print("ERROR: $val"),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _controller.text =
                  val.recognizedWords; // ✅ Fill textfield with speech
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop(); // ✅ Stop listening
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
    _speech = stt.SpeechToText(); // ✅ Init speech recognition
  }

  Future<void> _initializeSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print("STATUS: $val"),
      onError: (val) => print("ERROR: $val"),
    );
    print("Speech available: $available");
  }

  @override
  void dispose() {
    _speech.stop();
    flutterTts.stop(); // ✅ Stop TTS when page is closed
    super.dispose();
  }

  String _currentTime() {
    final now = DateTime.now();
    return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Sahaay AI Assistant'),
            SizedBox(height: 2),
            Text(
              'Online • Available 24/7',
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final chat = _messages[index];
                return _MessageBubble(
                  isUser: chat.isUser,
                  message: chat.message,
                  time: chat.time,
                  onSpeak: chat.isUser
                      ? null
                      : () => flutterTts.speak(chat.message),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
                  onPressed: _listen,
                  icon: const Icon(Icons.mic, color: Colors.blue),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Share what\'s on your mind...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF0F4F8),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final String time;
  final VoidCallback? onSpeak; // ✅ Added for replay button

  const _MessageBubble({
    required this.message,
    required this.isUser,
    required this.time,
    this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isUser
                ? const Radius.circular(16)
                : const Radius.circular(0),
            bottomRight: isUser
                ? const Radius.circular(0)
                : const Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(message)),
                if (onSpeak != null) // ✅ Speaker button only for AI
                  IconButton(
                    icon: const Icon(Icons.volume_up, size: 18),
                    onPressed: onSpeak,
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
