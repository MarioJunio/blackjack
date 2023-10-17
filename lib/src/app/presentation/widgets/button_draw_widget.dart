// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonDrawWidget extends StatelessWidget {
  const ButtonDrawWidget({
    Key? key,
    this.onPress,
    this.enabled = true,
    this.loading = false,
    required this.text,
    this.size = const Size(65, 65),
  }) : super(key: key);

  final String text;
  final Function()? onPress;
  final bool? enabled;
  final bool? loading;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    if (loading!) {
      return const CircularProgressIndicator();
    }

    return SizedBox(
      width: size!.width,
      height: size!.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xff004225),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        onPressed: enabled! ? onPress : null,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }
}
