import 'package:pricer_project/data/dataprovider/api.dart';
import 'package:pricer_project/models/tokped/tokped_response.dart';

class TokpedRepositories {
  final PricerApi pricerApi;
  TokpedRepositories({required this.pricerApi});

  // find product
  Future<TokpedResponse> getTokpedProduct(
      {required String query, required String limit}) async {
    TokpedResponse tokpedResponse =
        await pricerApi.getTokpedProduct(query: query, limit: limit);
    return tokpedResponse;
  }
}
