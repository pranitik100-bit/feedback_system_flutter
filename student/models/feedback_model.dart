class FeedbackModel {
  final String id;
  final String studentId;
  final String teacherId;
  final String teacherName;
  final String subjectId;
  final String subjectName;
  final int rating;
  final String comment;
  final bool anonymous;
  final DateTime submittedAt;

  FeedbackModel({
    required this.id,
    required this.studentId,
    required this.teacherId,
    required this.teacherName,
    required this.subjectId,
    required this.subjectName,
    required this.rating,
    required this.comment,
    required this.anonymous,
    required this.submittedAt,
  });

  // Convert Firestore document → FeedbackModel
  factory FeedbackModel.fromMap(
      Map<String, dynamic> map,
      String documentId,
      ) {
    return FeedbackModel(
      id: documentId,
      studentId: map['studentId'] ?? '',
      teacherId: map['teacherId'] ?? '',
      teacherName: map['teacherName'] ?? '',
      subjectId: map['subjectId'] ?? '',
      subjectName: map['subjectName'] ?? '',
      rating: map['rating'] ?? 0,
      comment: map['comment'] ?? '',
      anonymous: map['anonymous'] ?? false,
      submittedAt: map['submittedAt'] != null
          ? DateTime.parse(map['submittedAt'])
          : DateTime.now(),
    );
  }

  // Convert FeedbackModel → Firestore document
  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'teacherId': teacherId,
      'teacherName': teacherName,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'rating': rating,
      'comment': comment,
      'anonymous': anonymous,
      'submittedAt': submittedAt.toIso8601String(),
    };
  }
}
