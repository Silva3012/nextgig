import 'package:flutter/material.dart';

@immutable
class BusinessDetails {
  final String name;
  final String sector;
  final String description;
  final List<String> services;

  const BusinessDetails({
    required this.name,
    required this.sector,
    required this.description,
    required this.services,
  });
}

@immutable
class Education {
  final String qualification;
  final String institution;
  final DateTime startDate;
  final DateTime endDate;

  const Education({
    required this.qualification,
    required this.institution,
    required this.startDate,
    required this.endDate,
  });
}

@immutable
class Review {
  final String reviewerId;
  final String comment;
  final int rating;
  final DateTime date;

  const Review({
    required this.reviewerId,
    required this.comment,
    required this.rating,
    required this.date,
  });
}

@immutable
class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String idNumber;
  final bool idVerified;
  final String location;
  final bool locationVerified;
  final bool isRemote;
  final bool isBusinessOwner;
  final BusinessDetails? businessDetails;
  final List<String> portfolioLinks;
  final List<String> languages;
  final List<String> skills;
  final List<String> learningInterests;
  final List<Education> educationHistory;
  final double reputationScore;
  final List<Review> reviews;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.idNumber,
    required this.idVerified,
    required this.location,
    required this.locationVerified,
    required this.isRemote,
    required this.isBusinessOwner,
    required this.businessDetails,
    required this.portfolioLinks,
    required this.languages,
    required this.skills,
    required this.learningInterests,
    required this.educationHistory,
    required this.reputationScore,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });
}
