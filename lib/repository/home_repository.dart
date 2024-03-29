import 'package:mvvmapp/data/network/BaseApiService.dart';
import 'package:mvvmapp/data/network/NetworkApiService.dart';
import 'package:mvvmapp/model/movie_list_model.dart';
import 'package:mvvmapp/res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
