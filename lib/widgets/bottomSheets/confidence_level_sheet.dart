import 'package:flutter/material.dart';
import '../../core/style/colors.dart';
import '../../core/style/radius.dart';

class ConfidenceLevelSheet extends StatefulWidget {
  final int? initialSelectedLevel;
  final Function(int) onLevelSelected;

  const ConfidenceLevelSheet({
    Key? key,
    this.initialSelectedLevel,
    required this.onLevelSelected,
  }) : super(key: key);

  static Future<int?> show({
    required BuildContext context,
    int? initialSelectedLevel,
    required Function(int) onLevelSelected,
  }) async {
    return await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ConfidenceLevelSheet(
        initialSelectedLevel: initialSelectedLevel,
        onLevelSelected: onLevelSelected,
      ),
    );
  }

  @override
  State<ConfidenceLevelSheet> createState() => _ConfidenceLevelSheetState();
}

class _ConfidenceLevelSheetState extends State<ConfidenceLevelSheet> {
  late int selectedLevel;
  final ScrollController _scrollController = ScrollController();
  final List<String> confidenceLevels = ['00', '01', '02', '03', '04', '05', '06'];
  final double itemHeight = 52.0;
  bool isScrolling = false;
  
  @override
  void initState() {
    super.initState();
    selectedLevel = widget.initialSelectedLevel ?? 3;
    
    // Add post-frame callback to scroll to the initial selected item
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedItem(animate: false);
    });
    
    // Add listener to track scroll position
    _scrollController.addListener(_onScroll);
  }
  
  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
  
  void _onScroll() {
    if (!_scrollController.hasClients || !mounted) return;
    
    setState(() {
      isScrolling = true;
    });
    
    // Calculate which item is centered
    final double offset = _scrollController.offset;
    final int centralIndex = (offset / itemHeight).round();
    
    if (centralIndex >= 0 && centralIndex < confidenceLevels.length) {
      setState(() {
        selectedLevel = centralIndex;
      });
      widget.onLevelSelected(centralIndex);
    }
    
    // Debounce the scrolling state
    if (!_scrollController.position.isScrollingNotifier.value) {
      // User stopped scrolling, snap to the nearest item
      Future.delayed(const Duration(milliseconds: 150), () {
        if (mounted) {
          _scrollToSelectedItem(animate: true);
          setState(() {
            isScrolling = false;
          });
        }
      });
    }
  }
  
  void _scrollToSelectedItem({bool animate = true}) {
    if (!_scrollController.hasClients) return;
    
    final double offset = selectedLevel * itemHeight;
    
    if (animate) {
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollController.jumpTo(offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F4), // Light grey background from the screenshot
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Close button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD8E0E8), // Light grey background for close button
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: Color(0xFF2B2F3D), // Dark grey color for the X icon
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // Fixed-height container for the picker with selection indicator
          SizedBox(
            height: 260,
            child: Stack(
              children: [
                // The scrollable list
                ListView.builder(
                  controller: _scrollController,
                  itemCount: confidenceLevels.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    // Calculate opacity based on distance from selected item
                    double opacity = 1.0;
                    int distance = (index - selectedLevel).abs();
                    if (distance == 1) opacity = 0.4;
                    else if (distance == 2) opacity = 0.2;
                    else if (distance >= 3) opacity = 0.1;
                    
                    return _buildConfidenceOption(
                      confidenceLevels[index], 
                      index, 
                      opacity: opacity,
                      isSelected: index == selectedLevel,
                    );
                  },
                ),
                
                // Fixed selection indicator (black lines)
                Positioned(
                  left: 0,
                  right: 0,
                  top: (260 - itemHeight) / 2,
                  child: Container(
                    height: itemHeight,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 0.2),
                        bottom: BorderSide(color: Colors.black, width: 0.2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildConfidenceOption(String label, int level, {double opacity = 1.0, bool isSelected = false}) {
    return Container(
      width: double.infinity,
      height: itemHeight,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.primary.withOpacity(opacity),
          ),
        ),
      ),
    );
  }
}

// Custom painter for the checkmark
class CheckmarkPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  CheckmarkPainter({
    required this.color,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width / 3, size.height)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CheckmarkPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}
