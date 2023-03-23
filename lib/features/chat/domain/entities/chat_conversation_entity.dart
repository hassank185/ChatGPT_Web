
import 'package:equatable/equatable.dart';
import 'package:flutter_web_chat_gpt/features/chat/domain/entities/chat_conversation_data_entity.dart';

class ChatConversationEntity extends Equatable {
  final String? id;
  final List<ChatConversationDataEntity>? choices;

  ChatConversationEntity({this.id, this.choices});

  @override
  List<Object?> get props => [id, choices];
}
