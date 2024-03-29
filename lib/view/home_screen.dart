import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvmapp/data/response/status.dart';
import 'package:mvvmapp/res/color.dart';
import 'package:mvvmapp/utils/routes/routes_name.dart';
import 'package:mvvmapp/utils/utils.dart';
import 'package:mvvmapp/view_model/services/home_view_model.dart';
import 'package:mvvmapp/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          actions: [
            GestureDetector(
                onTap: () {
                  userPreference.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: const Center(
                    child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.whiteColor,
                  ),
                ))),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: ChangeNotifierProvider<HomeViewViewModel>(
          create: (BuildContext context) => homeViewViewModel,
          child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()));

              case null:
                return const Center(child: Text("No Data"));
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            value.moviesList.data!.movies![index].posterurl
                                .toString(),
                            height: 70,
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stack) {
                              return const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 50,
                              );
                            },
                          ),
                          title: Text(value
                              .moviesList.data!.movies![index].title
                              .toString()),
                          subtitle: Text(value
                              .moviesList.data!.movies![index].year
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Utils.averageRating(value
                                      .moviesList.data!.movies![index].ratings!)
                                  .toStringAsFixed(1)),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
            }
          }),
        ));
  }
}
