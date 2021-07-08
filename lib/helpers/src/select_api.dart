part of helpers;

Future<BsSelectBoxResponse> selectType(Map<String, String> params, {String? typeid}) async {
  TypeService typeService = TypeService();

  if(typeid != null)
    params.addAll({'typeid': typeid.toString()});

  Response response = await typeService.select(params);
  if(response.result!)
    return BsSelectBoxResponse.createFromJson(response.data);

  return BsSelectBoxResponse(options: []);
}