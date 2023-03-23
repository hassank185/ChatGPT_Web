
import 'package:flutter_web_chat_gpt/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:flutter_web_chat_gpt/features/chat/domain/repositories/chat_repository.dart';

import '../../domain/entities/chat_conversation_entity.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ChatConversationEntity> chatConversation(String prompt,
          Function(bool isReqComplete) onCompleteReqProcessing) async =>
      remoteDataSource.chatConversation(prompt, onCompleteReqProcessing);
}
