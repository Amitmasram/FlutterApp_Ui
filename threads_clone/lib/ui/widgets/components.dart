import 'package:flutter/material.dart';

import '../utils/theme.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {},
      cursorColor: AppsTheme.color.neutral.shade600,
      style: TextStyle(
        fontSize: 16,
        color: AppsTheme.color.neutral.shade600,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        fillColor: AppsTheme.color.neutral.shade400,
        hintText: "Search",
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppsTheme.color.neutral.shade600,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search,
            color: AppsTheme.color.neutral.shade600,
            size: 25,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide:
              BorderSide(color: AppsTheme.color.neutral.shade400, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide:
              BorderSide(color: AppsTheme.color.neutral.shade400, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide:
              BorderSide(color: AppsTheme.color.neutral.shade400, width: 1),
        ),
      ),
    );
  }
}
