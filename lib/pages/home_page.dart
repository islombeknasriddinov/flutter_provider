import 'package:flutter/material.dart';
import 'package:flutter_provider/viewmoel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../views/item_of_post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Consumer<HomeViewModel>(
            builder: (ctx, model, index) => Stack(
              children: [
                ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(viewModel, viewModel.items[index]);
                  },
                ),
                viewModel.isLoading
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            // Respond to button press
          },
          child: Icon(Icons.add),
        ));
  }

}
