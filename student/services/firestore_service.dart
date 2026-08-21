import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_system_flutter/student/models/student_model.dart';
import 'package:feedback_system_flutter/student/models/feedback_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  // ============================================================
  // STUDENT
  // ============================================================

  Future<StudentModel?> getStudent(
      String studentId,
      ) async {
    try {
      final document = await _firestore
          .collection('students')
          .doc(studentId)
          .get();

      if (!document.exists) {
        return null;
      }

      return StudentModel.fromMap(
        document.data()!,
        document.id,
      );
    } catch (e) {
      throw 'Unable to load student information.';
    }
  }

  // ============================================================
  // FIND STUDENT BY ENROLLMENT NUMBER
  // ============================================================

  Future<StudentModel?> getStudentByEnrollment(
      String enrollmentNumber,
      ) async {
    try {
      final result = await _firestore
          .collection('students')
          .where(
        'enrollmentNumber',
        isEqualTo: enrollmentNumber.trim(),
      )
          .limit(1)
          .get();

      if (result.docs.isEmpty) {
        return null;
      }

      final document = result.docs.first;

      return StudentModel.fromMap(
        document.data(),
        document.id,
      );
    } catch (e) {
      throw 'Unable to find student information.';
    }
  }

  // ============================================================
  // TEACHERS
  // ============================================================

  Future<List<Map<String, dynamic>>> getTeachers() async {
    try {
      final result = await _firestore
          .collection('teachers')
          .where('active', isEqualTo: true)
          .get();

      return result.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();
    } catch (e) {
      throw 'Unable to load teachers.';
    }
  }

  // ============================================================
  // SUBJECTS
  // ============================================================

  Future<List<Map<String, dynamic>>> getSubjects() async {
    try {
      final result = await _firestore
          .collection('subjects')
          .where('active', isEqualTo: true)
          .get();

      return result.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();
    } catch (e) {
      throw 'Unable to load subjects.';
    }
  }

  // ============================================================
  // SUBMIT FEEDBACK
  // ============================================================

  Future<void> submitFeedback(
      FeedbackModel feedback,
      ) async {
    try {
      await _firestore
          .collection('feedback')
          .add(feedback.toMap());
    } catch (e) {
      throw 'Unable to submit feedback. Please try again.';
    }
  }

  // ============================================================
  // STUDENT FEEDBACK HISTORY
  // ============================================================

  Future<List<FeedbackModel>> getStudentFeedback(
      String studentId,
      ) async {
    try {
      final result = await _firestore
          .collection('feedback')
          .where(
        'studentId',
        isEqualTo: studentId,
      )
          .get();

      final feedbackList = result.docs.map((doc) {
        return FeedbackModel.fromMap(
          doc.data(),
          doc.id,
        );
      }).toList();

      // Latest feedback first
      feedbackList.sort(
            (a, b) => b.submittedAt.compareTo(a.submittedAt),
      );

      return feedbackList;
    } catch (e) {
      throw 'Unable to load feedback history.';
    }
  }

  // ============================================================
  // CHECK WHETHER FEEDBACK ALREADY EXISTS
  // ============================================================

  Future<bool> hasSubmittedFeedback({
    required String studentId,
    required String teacherId,
    required String subjectId,
  }) async {
    try {
      final result = await _firestore
          .collection('feedback')
          .where(
        'studentId',
        isEqualTo: studentId,
      )
          .where(
        'teacherId',
        isEqualTo: teacherId,
      )
          .where(
        'subjectId',
        isEqualTo: subjectId,
      )
          .limit(1)
          .get();

      return result.docs.isNotEmpty;
    } catch (e) {
      throw 'Unable to check feedback status.';
    }
  }
}
