import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuraOtpField extends StatefulWidget {
  const AuraOtpField({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
    this.autofillHints,
  });

  final int length;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;

  @override
  State<AuraOtpField> createState() => _AuraOtpFieldState();
}

class _AuraOtpFieldState extends State<AuraOtpField> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.length, (_) => TextEditingController());

    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }

    for (final f in _focusNodes) {
      f.dispose();
    }

    super.dispose();
  }

  void _notify() {
    final code = _controllers.map((e) => e.text).join();

    widget.onChanged?.call(code);

    if (code.length == widget.length) {
      widget.onCompleted?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index == widget.length - 1 ? 0 : 10,
            ),
            child: KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event) {
                if (event is KeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.backspace &&
                    _controllers[index].text.isEmpty &&
                    index > 0) {
                  _focusNodes[index - 1].requestFocus();
                  _controllers[index - 1].clear();
                  _notify();
                }
              },
              child: TextFormField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                maxLength: 1,
                autofillHints: widget.autofillHints,

                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],

                decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  fillColor: AppColors.white,

                  contentPadding: const EdgeInsets.symmetric(vertical: 18),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.grey),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),

                onChanged: (value) {
                  if (value.isNotEmpty && index < widget.length - 1) {
                    _focusNodes[index + 1].requestFocus();
                  }

                  _notify();
                },

                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },

                onFieldSubmitted: (_) {
                  if (index == widget.length - 1) {
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
