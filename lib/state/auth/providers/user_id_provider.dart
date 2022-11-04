import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_app_sky/state/auth/posts/typedefs/user_id.dart';
import 'package:instagram_app_sky/state/auth/providers/auth_state_provider.dart';

final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);
