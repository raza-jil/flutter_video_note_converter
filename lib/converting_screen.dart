import 'dart:async';
import 'package:flutter/material.dart';

class ConvertingScreen extends StatefulWidget {
  const ConvertingScreen({super.key});

  @override
  State<ConvertingScreen> createState() => _ConvertingScreenState();
}

class _ConvertingScreenState extends State<ConvertingScreen> {
  // Progress state (0.0 to 1.0)
  double _progress = 0.65; // Starting at 65% to match your screenshot
  bool _isVideoReady = true;
  bool _isCreatingNotes = true;
  bool _isFinishingTouches = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Simulate progress for demonstration purposes
    _startFakeProgress();
  }

  void _startFakeProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_progress >= 1.0) {
        timer.cancel();
        setState(() {
          _isFinishingTouches = true;
          _isCreatingNotes = false;
        });
        // Wait a moment, then finish
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            // TODO: Navigate to the final notes screen here
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NotesResultScreen()));
          }
        });
      } else {
        setState(() {
          _progress += 0.02; // Increase by 2% every 500ms
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Stop the timer before leaving
            _timer?.cancel();
            Navigator.pop(context);
          },
        ),
        title: const Text('Converting video', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Circular Progress Indicator
              SizedBox(
                width: 180,
                height: 180,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: _progress,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0F766E)),
                    ),
                    Center(
                      child: Text(
                        '${(_progress * 100).toInt()}%',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F766E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Main Title
              const Text(
                'Turning video into notes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'About 30 seconds remaining',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 32),

              // Video Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Introduction to Photosynthesis',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Biology basics · 12 min 48 sec',
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Progress Steps
              _buildStep(
                title: 'Video ready',
                subtitle: '12 min 48 sec of content',
                isCompleted: _isVideoReady,
              ),
              _buildStep(
                title: 'Creating your notes',
                subtitle: 'Organizing key ideas and timestamps',
                isCompleted: false,
                isActive: _isCreatingNotes,
              ),
              _buildStep(
                title: 'Finishing touches',
                subtitle: 'Your notes will be ready soon',
                isCompleted: false,
                isActive: _isFinishingTouches,
              ),

              const Spacer(),

              // Cancel Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton(
                  onPressed: () {
                    _timer?.cancel();
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF0F766E)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Cancel conversion',
                    style: TextStyle(color: Color(0xFF0F766E), fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build each step row
  Widget _buildStep({
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Circle
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isCompleted ? const Color(0xFFE6F4F1) : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isCompleted || isActive ? const Color(0xFF0F766E) : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: isCompleted
                ? const Icon(Icons.check, size: 16, color: Color(0xFF0F766E))
                : isActive
                ? const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF0F766E)),
            )
                : null,
          ),
          const SizedBox(width: 16),
          // Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isCompleted || isActive ? Colors.black87 : Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}