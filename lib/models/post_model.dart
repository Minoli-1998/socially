import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socially_app/utils/functions/mood.dart';

class Post {
  final String postId;
  final String postCaption;
  final Mood mood;
  final String userId;
  final String userName;
  final String profileImage;
  final int likes;
  final DateTime datePublished;
  final String postUrl;

  Post({
    required this.postId,
    required this.postCaption,
    required this.mood,
    required this.userId,
    required this.userName,
    required this.profileImage,
    required this.likes,
    required this.datePublished,
    required this.postUrl,
  });

  // convert from json
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'] ?? "",
      postCaption: json['postCaption'] ?? "",
      mood: MoodExtesnsion.fromString(json['mood'] ?? "happy"),
      userId: json['userId'] ?? "",
      userName: json['userName'] ?? "",
      profileImage: json['profileImage'] ?? "",
      likes: json['likes'] ?? 0,
      datePublished: (json['datePublished'] as Timestamp).toDate(),
      postUrl: json['postUrl'] ?? "",
    );
  }

  // convert to json
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'postCaption': postCaption,
      'mood': mood.name,
      'userId': userId,
      'userName': userName,
      'profileImage': profileImage,
      'likes': likes,
      'datePublished': Timestamp.fromDate(datePublished),
      'postUrl': postUrl,
    };
  }
}
