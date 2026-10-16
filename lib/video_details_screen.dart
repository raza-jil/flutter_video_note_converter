import 'package:flutter/material.dart';

class VideoDetailsScreen extends StatefulWidget {
  const VideoDetailsScreen({super.key});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  // State variables for selections
  String _selectedLanguage = 'English';
  String _selectedFormat = 'Detailed'; // 'Summary' or 'Detailed'
  bool _includeTimestamps = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Video details', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Preview Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4F1), // Light teal/green background
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Play Button
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0F766E),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 16),
                    // Video Title & Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'BIOLOGY BASICS',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F766E),
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'How plants turn light into energy',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.3),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '12:48',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Title and Subtitle
              const Text(
                'Introduction to Photosynthesis',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                'Biology basics · 12 min 48 sec',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 32),

              // Section Title
              const Text(
                'Make the notes yours',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Notes Language Dropdown
              const Text('Notes language', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: ['English', 'Spanish', 'French', 'German'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: const TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Notes Format (Summary / Detailed)
              const Text('Notes format', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              const SizedBox(height: 10),
              Row(
                children: [
                  // Summary Option
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFormat = 'Summary'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: _selectedFormat == 'Summary' ? const Color(0xFFE6F4F1) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _selectedFormat == 'Summary' ? const Color(0xFF0F766E) : Colors.grey.shade300,
                            width: _selectedFormat == 'Summary' ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Summary',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: _selectedFormat == 'Summary' ? const Color(0xFF0F766E) : Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Detailed Option
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFormat = 'Detailed'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: _selectedFormat == 'Detailed' ? const Color(0xFFE6F4F1) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _selectedFormat == 'Detailed' ? const Color(0xFF0F766E) : Colors.grey.shade300,
                            width: _selectedFormat == 'Detailed' ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_selectedFormat == 'Detailed')
                                const Icon(Icons.check, size: 18, color: Color(0xFF0F766E)),
                              if (_selectedFormat == 'Detailed') const SizedBox(width: 6),
                              Text(
                                'Detailed',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: _selectedFormat == 'Detailed' ? const Color(0xFF0F766E) : Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Timestamps Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Include timestamps', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text('Jump back to key video moments.', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    ],
                  ),
                  Switch(
                    value: _includeTimestamps,
                    onChanged: (value) => setState(() => _includeTimestamps = value),
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFF0F766E),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Generate Notes Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Add the conversion logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Generating notes...')),
                    );
                  },
                  icon: const Icon(Icons.description_outlined, color: Colors.white),
                  label: const Text(
                    'Generate notes',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F766E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
}