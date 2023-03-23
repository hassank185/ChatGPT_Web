
import 'package:flutter_web_chat_gpt/features/chat/data/models/chat_conversation_data.dart';
import 'package:flutter_web_chat_gpt/features/chat/domain/entities/chat_conversation_data_entity.dart';
import 'package:flutter_web_chat_gpt/features/chat/domain/entities/chat_conversation_entity.dart';

class ChatConversationModel extends ChatConversationEntity {
  ChatConversationModel(
      final String? id,
      final List<ChatConversationDataEntity>? choices,
      ):super(choices: choices,id: id);


  factory ChatConversationModel.fromJson(Map<String, dynamic>json) {
    final chatConversationMessageItem = json['choices'] as List;

    List<ChatConversationDataEntity> choices = chatConversationMessageItem
        .map((messageItem)
    => ChatConversationData.fromJson(messageItem)).toList();

    return ChatConversationModel(json['id'], json['choices']);
  }

}