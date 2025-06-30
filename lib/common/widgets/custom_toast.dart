import 'package:fluttertoast/fluttertoast.dart';
import 'package:omniview/common/constants/app_errors.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/theme/app_colors.dart';

void customToast({
  required String? message,
  bool? isSuccess = false,
  Duration duration = const Duration(seconds: 4),
}) {
  Fluttertoast.showToast(
    webPosition: 'right',
    msg: message ?? AppErrors.serverErrorDetails,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP_RIGHT,
    timeInSecForIosWeb: 4,
    backgroundColor: AppColors.white,
    textColor: AppColors.black,
    fontSize: 14.textMultiplier,
  );
}
