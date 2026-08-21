import 'package:flutter/material.dart';

class FeedbackHistory extends StatefulWidget {
  const FeedbackHistory({super.key});

  @override
  State<FeedbackHistory> createState() => _FeedbackHistoryState();
}

class _FeedbackHistoryState extends State<FeedbackHistory> {
  String selectedFilter = 'All';

  final List<Map<String, dynamic>> feedbackList = [
    {
      'subject': 'Operating Systems',
      'teacher': 'Prof. Rahul Joshi',
      'rating': 4,
      'date': '18 Aug 2026',
      'status': 'Submitted',
      'anonymous': false,
      'feedbackId': '#FB10245',
    },
    {
      'subject': 'Computer Networks',
      'teacher': 'Prof. Anjali Deshmukh',
      'rating': 5,
      'date': '15 Aug 2026',
      'status': 'Reviewed',
      'anonymous': true,
      'feedbackId': '#FB10231',
    },
    {
      'subject': 'Software Engineering',
      'teacher': 'Prof. Sneha Kulkarni',
      'rating': 4,
      'date': '12 Aug 2026',
      'status': 'Submitted',
      'anonymous': false,
      'feedbackId': '#FB10198',
    },
    {
      'subject': 'Data Analytics',
      'teacher': 'Prof. Amit Shah',
      'rating': 5,
      'date': '08 Aug 2026',
      'status': 'Reviewed',
      'anonymous': true,
      'feedbackId': '#FB10176',
    },
  ];

  List<Map<String, dynamic>> get filteredFeedback {
    if (selectedFilter == 'All') {
      return feedbackList;
    }

    return feedbackList.where((feedback) {
      return feedback['status'] == selectedFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FC),
        elevation: 0,
        foregroundColor: const Color(0xFF171923),
        title: const Text(
          'Feedback History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSummary(),

          const SizedBox(height: 18),

          _buildFilters(),

          const SizedBox(height: 15),

          Expanded(
            child: filteredFeedback.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                20,
                0,
                20,
                30,
              ),
              itemCount: filteredFeedback.length,
              itemBuilder: (context, index) {
                return _buildFeedbackCard(
                  filteredFeedback[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SUMMARY
  // ============================================================

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6655E8),
              Color(0xFF8065F3),
            ],
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6C5CE7).withOpacity(0.22),
              blurRadius: 20,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildSummaryItem(
              value: '${feedbackList.length}',
              label: 'Submitted',
            ),

            _buildDivider(),

            _buildSummaryItem(
              value: '${feedbackList.where(
                    (e) => e['status'] == 'Reviewed',
              ).length}',
              label: 'Reviewed',
            ),

            _buildDivider(),

            _buildSummaryItem(
              value: '4.5',
              label: 'Avg. Rating',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem({
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 35,
      color: Colors.white.withOpacity(0.22),
    );
  }

  // ============================================================
  // FILTERS
  // ============================================================

  Widget _buildFilters() {
    final filters = [
      'All',
      'Submitted',
      'Reviewed',
    ];

    return SizedBox(
      height: 38,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final selected = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF6C5CE7)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected
                      ? const Color(0xFF6C5CE7)
                      : const Color(0xFFE3E4EB),
                ),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : const Color(0xFF737685),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // FEEDBACK CARD
  // ============================================================

  Widget _buildFeedbackCard(
      Map<String, dynamic> feedback,
      ) {
    final int rating = feedback['rating'];

    return GestureDetector(
      onTap: () {
        _showFeedbackDetails(feedback);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 13),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE6E7EE),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.025),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                // SUBJECT ICON
                Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDEAFF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.rate_review_outlined,
                    color: Color(0xFF6C5CE7),
                    size: 22,
                  ),
                ),

                const SizedBox(width: 12),

                // SUBJECT + TEACHER
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        feedback['subject'],
                        style: const TextStyle(
                          color: Color(0xFF20212B),
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        feedback['teacher'],
                        style: const TextStyle(
                          color: Color(0xFF858999),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                // STATUS
                _buildStatusBadge(
                  feedback['status'],
                ),
              ],
            ),

            const SizedBox(height: 14),

            const Divider(
              height: 1,
              color: Color(0xFFEDEEF3),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                // RATING
                Row(
                  children: List.generate(
                    5,
                        (index) {
                      return Icon(
                        index < rating
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: const Color(0xFFF4A62A),
                        size: 17,
                      );
                    },
                  ),
                ),

                const SizedBox(width: 8),

                Text(
                  '$rating/5',
                  style: const TextStyle(
                    color: Color(0xFF6F7280),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const Spacer(),

                Text(
                  feedback['date'],
                  style: const TextStyle(
                    color: Color(0xFF999CAB),
                    fontSize: 10,
                  ),
                ),

                const SizedBox(width: 5),

                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF9B9EAB),
                  size: 18,
                ),
              ],
            ),

            const SizedBox(height: 11),

            Row(
              children: [
                Icon(
                  feedback['anonymous']
                      ? Icons.shield_outlined
                      : Icons.person_outline_rounded,
                  size: 14,
                  color: const Color(0xFF9295A4),
                ),
                const SizedBox(width: 5),
                Text(
                  feedback['anonymous']
                      ? 'Submitted anonymously'
                      : 'Submitted with identity',
                  style: const TextStyle(
                    color: Color(0xFF9295A4),
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(),

                Text(
                  feedback['feedbackId'],
                  style: const TextStyle(
                    color: Color(0xFFB0B2BC),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // STATUS BADGE
  // ============================================================

  Widget _buildStatusBadge(String status) {
    final bool reviewed = status == 'Reviewed';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: reviewed
            ? const Color(0xFFE7F8EF)
            : const Color(0xFFFFF3DC),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            reviewed
                ? Icons.check_circle_outline_rounded
                : Icons.access_time_rounded,
            size: 12,
            color: reviewed
                ? const Color(0xFF27945C)
                : const Color(0xFFAA741C),
          ),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              color: reviewed
                  ? const Color(0xFF27945C)
                  : const Color(0xFFAA741C),
              fontSize: 9,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                color: const Color(0xFFEDEAFF),
                borderRadius: BorderRadius.circular(27),
              ),
              child: const Icon(
                Icons.history_rounded,
                color: Color(0xFF6C5CE7),
                size: 40,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'No feedback found',
              style: TextStyle(
                color: Color(0xFF20212B),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 7),

            Text(
              'You have no $selectedFilter feedback yet.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF858999),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DETAILS BOTTOM SHEET
  // ============================================================

  void _showFeedbackDetails(
      Map<String, dynamic> feedback,
      ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(
            22,
            12,
            22,
            30,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9DAE1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEAFF),
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.rate_review_outlined,
                      color: Color(0xFF6C5CE7),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          feedback['subject'],
                          style: const TextStyle(
                            color: Color(0xFF20212B),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          feedback['teacher'],
                          style: const TextStyle(
                            color: Color(0xFF858999),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              const Text(
                'YOUR RATING',
                style: TextStyle(
                  color: Color(0xFF9295A4),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  ...List.generate(
                    5,
                        (index) => Icon(
                      index < feedback['rating']
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: const Color(0xFFF4A62A),
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${feedback['rating']}/5',
                    style: const TextStyle(
                      color: Color(0xFF6C5CE7),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _buildDetailRow(
                'Feedback ID',
                feedback['feedbackId'],
              ),

              _buildDetailRow(
                'Submitted',
                feedback['date'],
              ),

              _buildDetailRow(
                'Status',
                feedback['status'],
              ),

              _buildDetailRow(
                'Identity',
                feedback['anonymous']
                    ? 'Anonymous'
                    : 'Visible to institution',
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor:
                    const Color(0xFF6C5CE7),
                    side: const BorderSide(
                      color: Color(0xFFDCDDE5),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'CLOSE',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF9295A4),
              fontSize: 11,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF30323D),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
