import 'package:flutter/material.dart';
import 'package:flutter_provider/viewmoel/home_view_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post_model.dart';

Widget itemOfPost(HomeViewModel viewModel, Post post) {
  return Slidable(
    key: const ValueKey(0),
    startActionPane: ActionPane(
      motion: DrawerMotion(),
      dismissible: DismissiblePane(onDismissed: (){viewModel.items.removeAt(viewModel.items.length-1);},),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){
            viewModel.apiPostDelete(post).then((value) => {
              if(value) viewModel.apiPostList()
            });
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),

    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!.toUpperCase(),
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body!),
        ],
      ),
    ),
  );
}