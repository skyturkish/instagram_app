import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_app_sky/state/comments/notifiers/delete_comment_notifier.dart';
import 'package:instagram_app_sky/state/image_upload/typedefs/is_loading.dart';

final deleteCommentProvider = StateNotifierProvider<DeleteCommentStateNotifier, IsLoading>(
  (ref) => DeleteCommentStateNotifier(),
);
