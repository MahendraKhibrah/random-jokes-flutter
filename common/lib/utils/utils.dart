import 'dart:io';

import 'package:common/common.dart';
import 'package:common/utils/extension/exception_ext.dart';
import 'package:common/utils/locale.dart';
import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static void showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

  static String localizedIDRCurrency(int value) {
    final locale = Platform.localeName;
    final currencySymbol = (getLocaleName() == 'id') ? 'Rp ' : 'IDR ';
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: currencySymbol,
      decimalDigits: 0,
    );
    String formattedValue = formatter.format(value);
    return formattedValue.replaceAll(currencySymbol, '$currencySymbol ');
  }

  static DateTime? parseToDateTime(String dateInString, [String? format]) {
    try {
      return DateTime.parse(dateInString);
    } on Exception catch (e) {
      debugPrint(e.getMessage);
      return null;
    }
  }

  static bool isToday(DateTime? dateTime) {
    if (dateTime == null) {
      return false;
    }

    final today = DateTime.now();

    if (dateTime.year != today.year) {
      return false;
    }

    if (dateTime.month != today.month) {
      return false;
    }

    if (dateTime.day != today.day) {
      return false;
    }

    return true;
  }

  static String parseToDateTimeString(DateTime dateTime, [String? format]) =>
      DateFormat(format ?? 'dd/MM/yyyy', Platform.localeName).format(dateTime);

  static String formatDifferentDays(String dateTimeInString) {
    final dateTime = parseToDateTime(dateTimeInString);
    final dateTimeNow = DateTime.now();
    final dayDifference =
        dateTimeNow.difference(dateTime ?? dateTimeNow).inDays;
    return 'days_ago'.plural(dayDifference);
  }

  static String maskBankAccountNumber(String input) {
    if (input.length <= 4) {
      return input;
    }

    String maskedString = '';

    for (int i = 0; i < input.length - 4; i++) {
      maskedString += '*';
    }

    maskedString += input.substring(input.length - 4);

    return maskedString;
  }
}
