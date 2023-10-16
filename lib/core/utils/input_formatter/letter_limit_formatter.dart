import 'package:flutter/services.dart';
class LetterLimitTextInputFormatter extends TextInputFormatter {
  final int letterLimit;
  LetterLimitTextInputFormatter(this.letterLimit);
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue){
    if (newValue.text.length <= letterLimit) {
      return newValue;
    }
    else if (newValue.text.length>letterLimit){
      String finalText='';
      finalText=oldValue.text+newValue.text.substring(oldValue.text.length,letterLimit);
      return TextEditingValue(text: finalText, selection: TextSelection.collapsed(offset: finalText.length));
    }
    return oldValue;
  }
}