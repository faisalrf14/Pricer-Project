import 'package:pricer_project/data/dataprovider/api.dart';
import 'package:pricer_project/models/main_response/main_response.dart';

class SearchRepositories {
  final PricerApi pricerApi;
  SearchRepositories({this.pricerApi});

  // find product
  Future<MainResponse> getMainProducts({String query, String limit}) async {
    MainResponse tokpedResponse = await pricerApi.getMainProducts(query: query, limit: limit);
    return tokpedResponse;
  }
}
