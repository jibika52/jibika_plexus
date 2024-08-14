import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class MonthPicker extends StatefulWidget {
  const MonthPicker({super.key});

  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {

@override
  void initState() {

  // TODO: implement initState
    super.initState();
  }
  // ---------------------------------- FIELDS ---------------------------------
  DateTime? _selected;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Month Year Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selected == null)
              const Text('No month year selected.')
            else
              Text(DateFormat().add_yM().format(_selected!)),
            TextButton(
              child: const Text('DEFAULT LOCALE'),
              onPressed: () async => _onPressed(context: context),
            ),
            TextButton(
              child: const Text('BAHASA MALAYSIA'),
              onPressed: () async => _onPressed(context: context, locale: 'ms'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      locale: localeObj,
    );
    // final selected = await showDatePicker(
    //   context: context,
    //   initialDate: _selected ?? DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    //   locale: localeObj,
    // );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}
