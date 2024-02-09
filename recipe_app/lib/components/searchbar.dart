// ignore_for_file: dead_code, library_private_types_in_public_api

import 'package:bloc_practice/bloc/apibloc.dart';
import 'package:bloc_practice/bloc/apievent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*  A Custom class which is a functionality of searchbar in home screen.
    a boolean variable is used in this class which could be a good option do work
     instead of making different different screen and different search bar this way we can do it on
     single page*/

bool find = false;

class MySearchBar extends StatefulWidget {
  const MySearchBar({Key? key}) : super(key: key);

  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: searchController,
        onFieldSubmitted: (value) {
          if (find) {
            context
                .read<FindByIngredientsBloc>()
                .add(FindRecipeEvent(data: value));
          } else {
            context.read<ApiBloc>().add(GetApiEvent(query: value));
          }
        },
        decoration: InputDecoration(
          hintText: !find ? 'Search Recipe' : 'Search by ingredients',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                find = !find;
                searchController.clear();
                if (!find) {
                  context.read<FindByIngredientsBloc>().add(ClearEvent());
                }
              });
            },
            icon: const Icon(Icons.change_circle),
          ),
        ),
      ),
    );
  }
}
