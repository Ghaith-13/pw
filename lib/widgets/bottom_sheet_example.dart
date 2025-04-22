import 'package:flutter/material.dart';
import '../core/utils/asset_image.dart' as app_assets;
import '../core/style/colors.dart';
import 'add_role_bottom_sheet.dart';
import 'staff/staff_card.dart';
import 'staff/staff_member_card.dart';
import 'team/team_card.dart';
import 'overtime/overtime_status_card.dart';
import 'overtime/overtime_user_card.dart';
import 'project/project_card.dart';

/// Example showing how to use the custom bottom sheet
class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Button to show the specialized Add Role bottom sheet
            ElevatedButton(
              onPressed: () => _showAddRoleBottomSheet(context),
              child: const Text('Show Add Role Bottom Sheet'),
            ),
            const SizedBox(height: 24),
            // Example of Project Card in white style
            ProjectCard(
              title: 'ProjectWheel-v1',
              projectCode: 'PW-001',
              projectKey: 'PWKEY-001',
              contentType: 'Application',
              onEdit: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit project pressed')),
                );
              },
              onDelete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Delete project pressed')),
                );
              },
              onCopy: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copy project pressed')),
                );
              },
              onList: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('List project pressed')),
                );
              },
            ),
            const SizedBox(height: 24),
            // Example of Project Card in red style
            ProjectCard(
              title: 'ProjectWheel-v2',
              projectCode: 'PW-002',
              projectKey: 'PWKEY-002',
              contentType: 'Game',
              cardColor: AppColors.projectCardRed,
              onEdit: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit project pressed')),
                );
              },
              onDelete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Delete project pressed')),
                );
              },
              onCopy: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copy project pressed')),
                );
              },
              onList: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('List project pressed')),
                );
              },
            ),
            const SizedBox(height: 24),
            // Example of our Overtime User Card from Figma design
            OvertimeUserCard(
              staffName: 'Name Surname',
              approvedByName: 'Name Surname',
              otDate: '23-Jan-2024 18:59',
              projectName: 'Own Project 10',
              ticketNo: 'OP10-62',
              hoursLogged: '3.0',
              description:
                  'Lorem Ipsum dellor Lorem Ipsum dellor Lorem Ipsum dellor Lorem Ipsum dellor Lorem Ipsum dellor Lorem Ipsum dellor',
              isApproved: true,
              onApprovalChanged: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Approval status changed to: ${value ? 'Approved' : 'Rejected'}'),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            // Example of our Overtime Status Card with Clock icon
            OvertimeStatusCard(
              icon: app_assets.AssetImage.iconClock,
              value: '8',
              title: 'Approved Overtime Hours',
            ),
            const SizedBox(height: 24),
            // Example of a customized Overtime Status Card with Timer icon
            OvertimeStatusCard(
              icon: app_assets.AssetImage.iconTimer,
              value: '24',
              title: 'Pending Overtime Hours',
            ),
            const SizedBox(height: 24),
            // Example with User Circle icon
            OvertimeStatusCard(
              icon: app_assets.AssetImage.iconUserCircle,
              value: '6',
              title: 'Staff with Overtime',
            ),
            const SizedBox(height: 24),
            // Example of staff card
            StaffCard(
              name: 'Ava Williams',
              role: 'Developer',
              email: 'example@gmail.com',
              mobile: '234126',
              accessLevel: 'Manager',
              status: 'Active',
              onEdit: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Edit button pressed'),
                  ),
                );
              },
              onDelete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Delete button pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            // Example of our new staff member card (from Figma design)
            StaffMemberCard(
              name: 'Name Surname',
              role: 'Developer',
              onDelete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Delete staff member pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            // Example of our new team card
            TeamCard(
              name: 'AutomatedPros',
              role: 'Development Team',
              onEdit: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit team pressed')),
                );
              },
              onDelete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Delete team pressed')),
                );
              },
              onUserDetails: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Team details pressed')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Example of using the specialized Add Role bottom sheet
  void _showAddRoleBottomSheet(BuildContext context) {
    AddRoleBottomSheet.show(
      context: context,
      onRoleAdded: (name, type) {
        Navigator.pop(context);
        // Handle role added
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added role: $name ($type)'),
          ),
        );
      },
    );
  }
}
