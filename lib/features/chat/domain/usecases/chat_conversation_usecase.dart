



import 'package:flutter_web_chat_gpt/features/chat/domain/entities/chat_conversation_entity.dart';
import 'package:flutter_web_chat_gpt/features/chat/domain/repositories/chat_repository.dart';

class ChatConversationUseCase {
  final ChatRepository repository;

  ChatConversationUseCase({required this.repository});

  Future<ChatConversationEntity> call(String prompt, Function(bool isReqComplete) onCompleteReqProcessing){
    return repository.chatConversation(prompt, onCompleteReqProcessing);
  }

}