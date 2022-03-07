import 'package:flutter/material.dart';

class Stories {
  Stories({
    required this.name,
    required this.story,
    required this.company,
    required this.by,
    required this.tags,
    required this.upvotes,
    required this.downvotes,
  });

  String? name;
  String? story;
  String? company;
  String? by;
  String tags;
  int upvotes = 0;
  int downvotes = 0;
}
