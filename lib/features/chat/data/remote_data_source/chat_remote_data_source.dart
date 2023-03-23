


import 'package:flutter_web_chat_gpt/features/chat/domain/entities/chat_conversation_entity.dart';

abstract class ChatRemoteDataSource{
  Future<ChatConversationEntity> chatConversation(
      String prompt,
      Function(bool isReqComplete) onCompleteReqProcessing,
      );
}