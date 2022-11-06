import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:instagram_app_sky/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_app_sky/state/image_upload/providers/image_uploader_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadingImage = ref.watch(imageUploaderProvider);

  return authState.isLoading || isUploadingImage;
});
