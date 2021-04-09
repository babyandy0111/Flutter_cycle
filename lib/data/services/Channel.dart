import 'package:indochat_officialaccount/data/repositorys/ChannelListRepository.dart';
import '../../core/http/api_response.dart';
import '../models/response/ChannelListEntity.dart';

Future<ChannelListEntity> getList() async {
  ApiResponse<ChannelListEntity> entity = await ChannelListRepository.getChannelList();
  return entity.data;
}