import 'package:flutter/material.dart';
import '../../core/style/colors.dart';
import '../../core/style/typography.dart';
import '../../core/style/spacing.dart';
import '../../core/style/radius.dart';
import 'confidence_level_sheet.dart';

class TicketSetConfidenceSheet extends StatefulWidget {
  final String staffName;
  final String? initialConfidence;
  final Function(String?) onConfirm;
  
  const TicketSetConfidenceSheet({
    Key? key,
    required this.staffName,
    this.initialConfidence,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<TicketSetConfidenceSheet> createState() => _TicketSetConfidenceSheetState();
}

class _TicketSetConfidenceSheetState extends State<TicketSetConfidenceSheet> {
  String? selectedConfidence;
  int selectedLevel = 3; // Default to level '03'
  
  // Mapping between confidence levels and labels
  final Map<int, String> confidenceLevels = {
    0: 'Very Low',
    1: 'Low',
    2: 'Medium-Low',
    3: 'Medium',
    4: 'Medium-High',
    5: 'High',
    6: 'Very High'
  };
  
  @override
  void initState() {
    super.initState();
    selectedConfidence = widget.initialConfidence;
    
    // Set initial level based on confidence if provided
    if (selectedConfidence != null) {
      switch (selectedConfidence) {
        case 'Low':
          selectedLevel = 1;
          break;
        case 'Medium':
          selectedLevel = 3;
          break;
        case 'High':
          selectedLevel = 5;
          break;
        default:
          selectedLevel = 3;
      }
    }
  }
  
  // Open the confidence level sheet
  void _openConfidenceLevelSheet() async {
    final result = await ConfidenceLevelSheet.show(
      context: context,
      initialSelectedLevel: selectedLevel,
      onLevelSelected: (level) {
        setState(() {
          selectedLevel = level;
          selectedConfidence = confidenceLevels[level];
        });
      },
    );
    
    if (result != null) {
      setState(() {
        selectedLevel = result;
        selectedConfidence = confidenceLevels[result];
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5), // Light grey background for the entire sheet
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Set Goal',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontSize: AppTypography.headingLSize,
                  fontWeight: AppTypography.bold,
                  color: AppColors.textBlack100,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD8E0E8), // Light gray background for close button
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: AppColors.textBlack100,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          
          // Staff Name Section
          Text(
            'Staff Name',
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: 13,
              fontWeight: AppTypography.semiBold,
              color: AppColors.textBlack100,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            decoration: BoxDecoration(
              color: const Color(0xFFD8E0E8), // Light gray background for the staff name field
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  widget.staffName,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontSize: 14,
                    fontWeight: AppTypography.regular,
                    color: AppColors.textBlack100,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          
          // Confidence Level Section
          Text(
            'Confidence Level',
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontSize: 13,
              fontWeight: AppTypography.semiBold,
              color: AppColors.textBlack100,
            ),
          ),
          const SizedBox(height: 10),
          
          // Clickable confidence level field that opens the picker
          GestureDetector(
            onTap: _openConfidenceLevelSheet,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0x1A2B3061), // Light border with 10% opacity
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedConfidence ?? 'Select',
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: 14,
                      fontWeight: AppTypography.regular,
                      color: selectedConfidence != null 
                          ? AppColors.textBlack100 
                          : AppColors.textBlack60,
                    ),
                  ),
                  Transform.rotate(
                    angle: 1.57, // 90 degrees in radians
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColors.textBlack100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 25),
          
          // Bottom Buttons
          Row(
            children: [
              // Reset Button (Outlined)
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedConfidence = null;
                      selectedLevel = 3; // Reset to default level
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: 14,
                      fontWeight: AppTypography.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Update Button (Filled)
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onConfirm(selectedConfidence);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontSize: 14,
                      fontWeight: AppTypography.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}

// Helper function to show the bottom sheet
Future<void> showTicketSetConfidenceSheet(
  BuildContext context, {
  required String staffName,
  String? initialConfidence,
  required Function(String?) onConfirm,
}) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: TicketSetConfidenceSheet(
        staffName: staffName,
        initialConfidence: initialConfidence,
        onConfirm: onConfirm,
      ),
    ),
  );
}
