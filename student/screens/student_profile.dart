import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FC),
        elevation: 0,
        foregroundColor: const Color(0xFF171923),
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
        child: Column(
          children: [
            _buildProfileHeader(),

            const SizedBox(height: 24),

            _buildSectionTitle('PERSONAL INFORMATION'),

            const SizedBox(height: 10),

            _buildInfoCard(
              icon: Icons.person_outline_rounded,
              title: 'Full Name',
              value: 'Nikita Patil',
            ),

            _buildInfoCard(
              icon: Icons.badge_outlined,
              title: 'Enrollment Number',
              value: 'ENR20260045',
            ),

            _buildInfoCard(
              icon: Icons.phone_outlined,
              title: 'Mobile Number',
              value: '+91 XXXXX XXXXX',
            ),

            const SizedBox(height: 22),

            _buildSectionTitle('ACADEMIC INFORMATION'),

            const SizedBox(height: 10),

            _buildInfoCard(
              icon: Icons.school_outlined,
              title: 'Course',
              value: 'Diploma in Information Technology',
            ),

            _buildInfoCard(
              icon: Icons.calendar_today_outlined,
              title: 'Semester',
              value: 'Semester 3',
            ),

            _buildInfoCard(
              icon: Icons.groups_outlined,
              title: 'Division',
              value: 'A',
            ),

            const SizedBox(height: 22),

            _buildSectionTitle('ACCOUNT'),

            const SizedBox(height: 10),

            _buildActionTile(
              icon: Icons.lock_outline_rounded,
              title: 'Change Password',
              subtitle: 'Update your login password',
              onTap: () {
                _showComingSoon(
                  context,
                  'Change Password',
                );
              },
            ),

            _buildActionTile(
              icon: Icons.notifications_none_rounded,
              title: 'Notifications',
              subtitle: 'Manage notification preferences',
              onTap: () {
                _showComingSoon(
                  context,
                  'Notifications',
                );
              },
            ),

            _buildActionTile(
              icon: Icons.info_outline_rounded,
              title: 'About Feedback System',
              subtitle: 'Learn about the platform',
              onTap: () {
                _showAbout(context);
              },
            ),

            const SizedBox(height: 18),

            // LOGOUT
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  size: 19,
                ),
                label: const Text(
                  'LOGOUT',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFE5484D),
                  side: const BorderSide(
                    color: Color(0xFFF0C8CA),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Student Feedback System • v1.0',
              style: TextStyle(
                color: Color(0xFFB0B2BC),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PROFILE HEADER
  // ============================================================

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6655E8),
            Color(0xFF8065F3),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C5CE7).withOpacity(0.22),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.18),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                'NP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'Nikita Patil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Diploma in Information Technology',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Semester 3 • Division A',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 17),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.13),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_outlined,
                  color: Colors.white,
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(
                  'Active Student',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF737685),
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 1,
        ),
      ),
    );
  }

  // ============================================================
  // INFORMATION CARD
  // ============================================================

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE7E8EF),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEAFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF6C5CE7),
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF9295A4),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF292B35),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTION TILE
  // ============================================================

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE7E8EF),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 3,
        ),
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFF0EEFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF6C5CE7),
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF292B35),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF9699A7),
            fontSize: 10,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: Color(0xFF9B9EAB),
        ),
      ),
    );
  }

  // ============================================================
  // COMING SOON
  // ============================================================

  void _showComingSoon(
      BuildContext context,
      String title,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title will be available soon.'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF6C5CE7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // ============================================================
  // ABOUT
  // ============================================================

  void _showAbout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            'Student Feedback System',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          content: const Text(
            'A digital platform that allows students to provide structured feedback about teaching and learning experiences.',
            style: TextStyle(
              color: Color(0xFF737685),
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'CLOSE',
                style: TextStyle(
                  color: Color(0xFF6C5CE7),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // LOGOUT
  // ============================================================

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            'Logout?',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          content: const Text(
            'Are you sure you want to logout from your student account?',
            style: TextStyle(
              color: Color(0xFF737685),
              height: 1.4,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: Color(0xFF737685),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                // Firebase logout will be connected later.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Logout will be connected with Firebase.',
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: const Color(0xFF6C5CE7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5484D),
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              child: const Text(
                'LOGOUT',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
