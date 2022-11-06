import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_app_sky/state/image_upload/typedefs/is_loading.dart';
import 'package:instagram_app_sky/state/posts/notifiers/delete_post_state_notifier.dart';

final deletePostProvider = StateNotifierProvider<DeletePostStateNotifier, IsLoading>(
  (ref) => DeletePostStateNotifier(),
);
