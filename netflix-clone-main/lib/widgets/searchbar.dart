import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  MySearchBar({
    Key? key,
    required this.query,
  }) : super(key: key);

  String query;

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  final searchQuery = TextEditingController();
  Widget build(BuildContext context) {
    print('Search Bar Query: ${widget.query}');
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchQuery,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                    gapPadding: 0),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                fillColor: Colors.white,
                filled: true,
                alignLabelWithHint: true,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                setState(() {
                  widget.query = value;
                });
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              // context.read<SearchbarController>().changeFilter();
              setState(() {
                widget.query = searchQuery.text;
              });
            },
            child: Container(
              height: 38,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF62E1F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                CupertinoIcons.search,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
