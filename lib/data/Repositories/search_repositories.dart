import 'package:pricer_project/data/dataprovider/api.dart';
import 'package:pricer_project/models/main_response/main_response.dart';

class SearchRepositories {
  final PricerApi pricerApi;
  SearchRepositories({required this.pricerApi});

  // find product
  Future<MainResponse> getMainProducts({
    required String query,
    required String limit,
    required bool fromLow,
  }) async {
    MainResponse tokpedResponse = await pricerApi.getMainProducts(
      query: query,
      limit: limit,
      fromLow: fromLow,
    );
    return tokpedResponse;
  }
}
