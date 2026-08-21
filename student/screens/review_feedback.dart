import 'package:flutter/material.dart';
import 'submission_success.dart';

class ReviewFeedback extends StatefulWidget {
  final String teacherName;
  final String subject;
  final int rating;

  const ReviewFeedback({
    super.key,
    required this.teacherName,
    required this.subject,
    required this.rating,
  });

  @override
  State<ReviewFeedback> createState() => _ReviewFeedbackState();
}

class _ReviewFeedbackState extends State<ReviewFeedback> {
  final TextEditingController feedbackController =
  TextEditingController();

  bool anonymous = false;

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
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
          'Review Feedback',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgress(),

              const SizedBox(height: 28),

              const Text(
                'Review your feedback',
                style: TextStyle(
                  color: Color(0xFF20212B),
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Make sure everything looks correct before submitting.',
                style: TextStyle(
                  color: Color(0xFF858999),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 25),

              // SUMMARY CARD
              _buildSummaryCard(),

              const SizedBox(height: 22),

              // FEEDBACK
              const Text(
                'YOUR FEEDBACK',
                style: TextStyle(
                  color: Color(0xFF737685),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 9),

              TextField(
                controller: feedbackController,
                maxLines: 6,
                maxLength: 500,
                decoration: InputDecoration(
                  hintText:
                  'Share your experience, suggestions or comments...',
                  hintStyle: const TextStyle(
                    color: Color(0xFFAAACB7),
                    fontSize: 12,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  counterStyle: const TextStyle(
                    color: Color(0xFF9B9EAB),
                    fontSize: 9,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: const BorderSide(
                      color: Color(0xFFE4E5EC),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: const BorderSide(
                      color: Color(0xFFE4E5EC),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: const BorderSide(
                      color: Color(0xFF6C5CE7),
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 17),

              // ANONYMOUS OPTION
              _buildAnonymousOption(),

              const SizedBox(height: 25),

              // PRIVACY NOTE
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEAFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.security_outlined,
                      color: Color(0xFF6C5CE7),
                      size: 19,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your feedback is securely stored and will only be used for academic improvement and analysis.',
                        style: TextStyle(
                          color: Color(0xFF5147A8),
                          fontSize: 10,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // SUBMIT
              SizedBox(
                width: double.infinity,
                height: 53,
                child: ElevatedButton(
                  onPressed: _submitFeedback,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C5CE7),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send_rounded,
                        size: 18,
                      ),
                      SizedBox(width: 9),
                      Text(
                        'SUBMIT FEEDBACK',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

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
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'GO BACK & EDIT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
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
        _step('1', 'SELECT', true),
        _line(),
        _step('2', 'RATE', true),
        _line(),
        _step('3', 'REVIEW', true),
      ],
    );
  }

  Widget _step(
      String number,
      String title,
      bool active,
      ) {
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
        color: const Color(0xFF6C5CE7),
      ),
    );
  }

  // ============================================================
  // SUMMARY
  // ============================================================

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE4E5EC),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 47,
                height: 47,
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

          const SizedBox(height: 15),

          const Divider(
            color: Color(0xFFEDEEF3),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Text(
                'Your Rating',
                style: TextStyle(
                  color: Color(0xFF858999),
                  fontSize: 11,
                ),
              ),

              const Spacer(),

              ...List.generate(
                5,
                    (index) {
                  return Icon(
                    index < widget.rating
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: const Color(0xFFF4A62A),
                    size: 19,
                  );
                },
              ),

              const SizedBox(width: 5),

              Text(
                '${widget.rating}/5',
                style: const TextStyle(
                  color: Color(0xFF6C5CE7),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ANONYMOUS
  // ============================================================

  Widget _buildAnonymousOption() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: anonymous
              ? const Color(0xFF6C5CE7)
              : const Color(0xFFE4E5EC),
        ),
      ),
      child: CheckboxListTile(
        value: anonymous,
        onChanged: (value) {
          setState(() {
            anonymous = value ?? false;
          });
        },
        activeColor: const Color(0xFF6C5CE7),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        secondary: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF0EEFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.shield_outlined,
            color: Color(0xFF6C5CE7),
            size: 20,
          ),
        ),
        title: const Text(
          'Submit anonymously',
          style: TextStyle(
            color: Color(0xFF292B35),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: const Text(
          'Your name will not be shown with this feedback',
          style: TextStyle(
            color: Color(0xFF9699A7),
            fontSize: 9,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SUBMIT
  // ============================================================

  void _submitFeedback() {
    if (feedbackController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Please write some feedback before submitting.',
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF6C5CE7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SubmissionSuccess(
          teacherName: widget.teacherName,
          subject: widget.subject,
        ),
      ),
    );
  }
}
