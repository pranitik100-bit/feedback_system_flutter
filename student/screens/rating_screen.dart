import 'package:flutter/material.dart';
import 'review_feedback.dart';

class RatingScreen extends StatefulWidget {
  final String teacherName;
  final String subject;

  const RatingScreen({
    super.key,
    required this.teacherName,
    required this.subject,
  });

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int rating = 0;

  final List<String> ratingLabels = [
    '',
    'Poor',
    'Needs Improvement',
    'Good',
    'Very Good',
    'Excellent',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FC),
        elevation: 0,
        foregroundColor: const Color(0xFF171923),
        title: const Text(
          'Rate Teaching',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 10, 22, 30),
          child: Column(
            children: [
              // PROGRESS
              _buildProgress(),

              const SizedBox(height: 35),

              // ICON
              Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEAFF),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Icon(
                  Icons.star_rounded,
                  color: Color(0xFF6C5CE7),
                  size: 43,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'How would you rate the teaching?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF20212B),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 9),

              const Text(
                'Your rating helps improve the teaching\nand learning experience.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF858999),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              // TEACHER CARD
              _buildTeacherCard(),

              const SizedBox(height: 35),

              // STARS
              _buildStars(),

              const SizedBox(height: 18),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  rating == 0
                      ? 'Tap a star to give your rating'
                      : ratingLabels[rating],
                  key: ValueKey(rating),
                  style: TextStyle(
                    color: rating == 0
                        ? const Color(0xFF9295A4)
                        : const Color(0xFF6C5CE7),
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                rating == 0
                    ? '1 = Poor    •    5 = Excellent'
                    : '$rating out of 5 stars',
                style: const TextStyle(
                  color: Color(0xFF9A9CA9),
                  fontSize: 10,
                ),
              ),

              const SizedBox(height: 45),

              // NEXT BUTTON
              SizedBox(
                width: double.infinity,
                height: 53,
                child: ElevatedButton(
                  onPressed: rating == 0
                      ? null
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewFeedback(
                          teacherName: widget.teacherName,
                          subject: widget.subject,
                          rating: rating,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C5CE7),
                    disabledBackgroundColor:
                    const Color(0xFFD9D7EA),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CONTINUE TO REVIEW',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PROGRESS
  // ============================================================

  Widget _buildProgress() {
    return Row(
      children: [
        _step(
          number: '1',
          title: 'SELECT',
          active: true,
        ),
        _line(),
        _step(
          number: '2',
          title: 'RATE',
          active: true,
        ),
        _line(),
        _step(
          number: '3',
          title: 'REVIEW',
          active: false,
        ),
      ],
    );
  }

  Widget _step({
    required String number,
    required String title,
    required bool active,
  }) {
    return Column(
      children: [
        Container(
          width: 31,
          height: 31,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active
                ? const Color(0xFF6C5CE7)
                : const Color(0xFFE3E4EB),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: active
                    ? Colors.white
                    : const Color(0xFF9295A4),
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: active
                ? const Color(0xFF6C5CE7)
                : const Color(0xFF9B9EAB),
            fontSize: 8,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _line() {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(
          bottom: 19,
          left: 5,
          right: 5,
        ),
        color: const Color(0xFFDCDDE5),
      ),
    );
  }

  // ============================================================
  // TEACHER CARD
  // ============================================================

  Widget _buildTeacherCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE5E6ED),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEAFF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.person_outline_rounded,
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
                  widget.teacherName,
                  style: const TextStyle(
                    color: Color(0xFF252631),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subject,
                  style: const TextStyle(
                    color: Color(0xFF8A8D9B),
                    fontSize: 10,
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
  // STAR RATING
  // ============================================================

  Widget _buildStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) {
          final starNumber = index + 1;

          return GestureDetector(
            onTap: () {
              setState(() {
                rating = starNumber;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                starNumber <= rating
                    ? Icons.star_rounded
                    : Icons.star_outline_rounded,
                color: starNumber <= rating
                    ? const Color(0xFFF4A62A)
                    : const Color(0xFFD4D5DD),
                size: starNumber <= rating ? 52 : 49,
              ),
            ),
          );
        },
      ),
    );
  }
}
