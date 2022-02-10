import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int getTotalRequests() {
  // Add your function code here!
  // get total requests
  final totalRequestSnapshot =
      FirebaseFirestore.instance.collection('posts').snapshots();
  print(totalRequestSnapshot.length);
  return totalRequestSnapshot.length as int;
}
