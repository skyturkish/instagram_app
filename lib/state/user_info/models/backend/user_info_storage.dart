import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_app_sky/state/auth/constants/firebase_collection_name.dart';
import 'package:instagram_app_sky/state/auth/constants/firebase_field_name.dart';
import 'package:instagram_app_sky/state/auth/posts/typedefs/user_id.dart';
import 'package:instagram_app_sky/state/user_info/models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .where(
            FirebaseFieldName.userId,
            isEqualTo: userId,
          )
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        // we already have this user's info
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? '',
        });
        return true;
      }
      // we don't have this user's info from before, create a new User
      final payload = UserInfoPayload(
        userId: userId,
        displayName: displayName,
        email: email,
      );

      await FirebaseFirestore.instance.collection(FirebaseCollectionName.users).add(
            payload,
          );

      return true;
    } catch (e) {
      return false;
    }
  }
}