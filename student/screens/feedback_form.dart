import 'package:flutter/material.dart';
import 'submission_success.dart';
import 'rating_screen.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  int currentStep = 0;

  String? selectedTeacher;
  String? selectedSubject;

  bool anonymous = false;

  final TextEditingController strengthsController =
  TextEditingController();

  final TextEditingController improvementsController =
  TextEditingController();

  final List<String> teachers = [
    'Prof. Swapnil Patil',
    'Prof. Priya Sharma',
    'Prof. Rahul Joshi',
    'Prof. Anjali Deshmukh',
  ];

  final List<String> subjects = [
    'Data Structures',
    'Database Management',
    'Operating Systems',
    'Computer Networks',
  ];

  final Map<String, double> ratings = {
    'Teaching Quality': 0,
    'Subject Knowledge': 0,
    'Communication': 0,
    'Doubt Clearing': 0,
    'Practical Examples': 0,
    'Overall Experience': 0,
  };

  @override
  void dispose() {
    strengthsController.dispose();
    improvementsController.dispose();
    super.dispose();
  }

  // ============================================================
  // NEXT
  // ============================================================

  void nextStep() {
    if (currentStep == 0) {
      if (selectedTeacher == null || selectedSubject == null) {
        _showMessage(
          'Please select a teacher and subject.',
          isError: true,
        );
        return;
      }
    }

    if (currentStep == 1) {
      if (ratings.values.any((rating) => rating == 0)) {
        _showMessage(
          'Please rate all the criteria.',
          isError: true,
        );
        return;
      }
    }

    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
    }
  }

  // ============================================================
  // BACK
  // ============================================================

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    } else {
      Navigator.pop(context);
    }
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(
      String message, {
        bool isError = false,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor:
        isError ? const Color(0xFFE5484D) : const Color(0xFF6C5CE7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF7F8FC),
        foregroundColor: const Color(0xFF171923),
        title: const Text(
          'Give Feedback',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildProgressHeader(),

          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildCurrentStep(),
            ),
          ),

          _buildBottomButtons(),
        ],
      ),
    );
  }

  // ============================================================
  // PROGRESS HEADER
  // ============================================================

  Widget _buildProgressHeader() {
    final steps = [
      'Select',
      'Rate',
      'Review',
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 5, 22, 20),
      child: Row(
        children: List.generate(
          steps.length,
              (index) {
            final bool completed = index < currentStep;
            final bool active = index == currentStep;

            return Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: completed || active
                              ? const Color(0xFF6C5CE7)
                              : const Color(0xFFE4E5EC),
                        ),
                        child: Center(
                          child: completed
                              ? const Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 19,
                          )
                              : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: active
                                  ? Colors.white
                                  : const Color(0xFF9295A4),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        steps[index],
                        style: TextStyle(
                          color: active || completed
                              ? const Color(0xFF6C5CE7)
                              : const Color(0xFF9295A4),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  if (index < steps.length - 1)
                    Expanded(
                      child: Container(
                        height: 2,
                        margin: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          bottom: 20,
                        ),
                        color: index < currentStep
                            ? const Color(0xFF6C5CE7)
                            : const Color(0xFFE1E2E9),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // CURRENT STEP
  // ============================================================

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return _buildSelectionStep();

      case 1:
        return _buildRatingStep();

      case 2:
        return _buildReviewStep();

      default:
        return const SizedBox();
    }
  }

  // ============================================================
  // STEP 1 — SELECTION
  // ============================================================

  Widget _buildSelectionStep() {
    return SingleChildScrollView(
      key: const ValueKey('selection'),
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tell us about your class',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Color(0xFF171923),
            ),
          ),

          const SizedBox(height: 7),

          const Text(
            'Select the teacher and subject you want to provide feedback for.',
            style: TextStyle(
              color: Color(0xFF858999),
              fontSize: 13,
              height: 1.45,
            ),
          ),

          const SizedBox(height: 27),

          _buildSectionLabel(
            'TEACHER',
            Icons.person_outline_rounded,
          ),

          const SizedBox(height: 9),

          _buildDropdown(
            value: selectedTeacher,
            hint: 'Select your teacher',
            icon: Icons.person_outline_rounded,
            items: teachers,
            onChanged: (value) {
              setState(() {
                selectedTeacher = value;
              });
            },
          ),

          const SizedBox(height: 24),

          _buildSectionLabel(
            'SUBJECT',
            Icons.menu_book_outlined,
          ),

          const SizedBox(height: 9),

          _buildDropdown(
            value: selectedSubject,
            hint: 'Select subject',
            icon: Icons.menu_book_outlined,
            items: subjects,
            onChanged: (value) {
              setState(() {
                selectedSubject = value;
              });
            },
          ),

          const SizedBox(height: 27),

          _buildInfoCard(),
        ],
      ),
    );
  }

  // ============================================================
  // DROPDOWN
  // ============================================================

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required IconData icon,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFE5E6ED),
        ),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Color(0xFF7C8090),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFFA0A3B0),
            fontSize: 13,
          ),
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF6C5CE7),
            size: 21,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
        ),
        items: items.map(
              (item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  color: Color(0xFF242631),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ).toList(),
        onChanged: onChanged,
      ),
    );
  }

  // ============================================================
  // INFO CARD
  // ============================================================

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEAFF),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: Color(0xFF6C5CE7),
            size: 21,
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Text(
              'Your feedback should be honest, respectful and based on your actual classroom experience.',
              style: TextStyle(
                color: Color(0xFF5147A8),
                fontSize: 12,
                height: 1.45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STEP 2 — RATINGS
  // ============================================================

  Widget _buildRatingStep() {
    return SingleChildScrollView(
      key: const ValueKey('rating'),
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rate your experience',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Color(0xFF171923),
            ),
          ),

          const SizedBox(height: 7),

          Text(
            selectedTeacher ?? 'Selected Teacher',
            style: const TextStyle(
              color: Color(0xFF6C5CE7),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 24),

          ...ratings.keys.map(
                (criterion) {
              return _buildRatingCard(criterion);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRatingCard(String criterion) {
    final rating = ratings[criterion] ?? 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFE8E9F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            criterion,
            style: const TextStyle(
              color: Color(0xFF242631),
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 11),

          Row(
            children: [
              ...List.generate(
                5,
                    (index) {
                  final starNumber = index + 1;
                  final selected = starNumber <= rating;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        ratings[criterion] = starNumber.toDouble();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 6,
                      ),
                      child: AnimatedScale(
                        scale: selected ? 1.08 : 1.0,
                        duration:
                        const Duration(milliseconds: 150),
                        child: Icon(
                          selected
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: const Color(0xFFF4A62A),
                          size: 29,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: rating == 0
                      ? const Color(0xFFF2F3F7)
                      : const Color(0xFFFFF4DD),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  rating == 0
                      ? 'Not rated'
                      : '${rating.toInt()}/5',
                  style: TextStyle(
                    color: rating == 0
                        ? const Color(0xFF9699A7)
                        : const Color(0xFF9B691B),
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STEP 3 — REVIEW
  // ============================================================

  Widget _buildReviewStep() {
    return SingleChildScrollView(
      key: const ValueKey('review'),
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tell us more',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Color(0xFF171923),
            ),
          ),

          const SizedBox(height: 7),

          const Text(
            'Your comments help us understand your ratings better.',
            style: TextStyle(
              color: Color(0xFF858999),
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 22),

          _buildTextSection(
            title: 'What did you like?',
            hint: 'Share something positive about the class...',
            controller: strengthsController,
            icon: Icons.thumb_up_alt_outlined,
          ),

          const SizedBox(height: 19),

          _buildTextSection(
            title: 'What can be improved?',
            hint: 'Tell us how the learning experience could be better...',
            controller: improvementsController,
            icon: Icons.lightbulb_outline_rounded,
          ),

          const SizedBox(height: 20),

          _buildAnonymousCard(),

          const SizedBox(height: 22),

          _buildSummaryCard(),
        ],
      ),
    );
  }

  // ============================================================
  // TEXT SECTION
  // ============================================================

  Widget _buildTextSection({
    required String title,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel(title, icon),

        const SizedBox(height: 9),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: const Color(0xFFE5E6ED),
            ),
          ),
          child: TextField(
            controller: controller,
            maxLines: 4,
            maxLength: 300,
            style: const TextStyle(
              color: Color(0xFF242631),
              fontSize: 13,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFFA0A3B0),
                fontSize: 12,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(15),
              counterStyle: const TextStyle(
                color: Color(0xFFA0A3B0),
                fontSize: 9,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ANONYMOUS CARD
  // ============================================================

  Widget _buildAnonymousCard() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFE5E6ED),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEAFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.shield_outlined,
              color: Color(0xFF6C5CE7),
              size: 21,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Submit anonymously',
                  style: TextStyle(
                    color: Color(0xFF242631),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Your identity will not be shown with your feedback.',
                  style: TextStyle(
                    color: Color(0xFF8B8E9C),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: anonymous,
            activeColor: const Color(0xFF6C5CE7),
            onChanged: (value) {
              setState(() {
                anonymous = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SUMMARY CARD
  // ============================================================

  Widget _buildSummaryCard() {
    final overallRating = ratings['Overall Experience'] ?? 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEDEAFF),
            Color(0xFFF5F3FF),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.star_rounded,
              color: Color(0xFFF4A62A),
              size: 28,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Overall Rating',
                  style: TextStyle(
                    color: Color(0xFF5C5F70),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${overallRating.toInt()} / 5',
                  style: const TextStyle(
                    color: Color(0xFF5147A8),
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.check_circle_outline_rounded,
            color: Color(0xFF6C5CE7),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION LABEL
  // ============================================================

  Widget _buildSectionLabel(
      String text,
      IconData icon,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF6C5CE7),
          size: 17,
        ),
        const SizedBox(width: 7),
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF676A79),
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // BOTTOM BUTTONS
  // ============================================================

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: previousStep,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(0, 52),
                side: const BorderSide(
                  color: Color(0xFFDCDDE5),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                currentStep == 0 ? 'CANCEL' : 'BACK',
                style: const TextStyle(
                  color: Color(0xFF666978),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                if (currentStep == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubmissionSuccess(
                        teacherName: selectedTeacher,
                        subject: selectedSubject,
                      ),
                    ),
                  );
                } else {
                  nextStep();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C5CE7),
                foregroundColor: Colors.white,
                elevation: 0,
                minimumSize: const Size(0, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentStep == 2 ? 'SUBMIT FEEDBACK' : 'NEXT',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Icon(
                    currentStep == 2
                        ? Icons.check_rounded
                        : Icons.arrow_forward_rounded,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
