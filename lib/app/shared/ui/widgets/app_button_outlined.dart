import 'package:flutter/material.dart';
import 'package:pintura/app/shared/ui/app_ui.dart';

class AppButtonOutlined extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? label;
  final double? width;
  final double? height;
  final Icon? icone;
  final Color? color;
  const AppButtonOutlined({
    Key? key,
    this.label,
    this.onPressed,
    this.width,
    this.height,
    this.icone,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null ? height! - 2 : height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: color ?? AppUi.corPrincipal,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: InkWell(
          highlightColor: AppUi.corPrincipal.withOpacity(.1),
          hoverColor: AppUi.corPrincipal.withOpacity(.1),
          focusColor: AppUi.corPrincipal.withOpacity(.1),
          splashColor: AppUi.corPrincipal.withOpacity(.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          onTap: onPressed,
          child: Ink(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icone != null) icone!,
                Visibility(
                  visible: icone != null,
                  child: const SizedBox(
                    width: 8,
                  ),
                ),
                if (label != null)
                  Text(
                    label!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: color ?? AppUi.corPrincipal,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
