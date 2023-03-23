



import 'package:flutter_web_chat_gpt/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:flutter_web_chat_gpt/features/chat/data/remote_data_source/chat_remote_data_source_impl.dart';
import 'package:flutter_web_chat_gpt/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:flutter_web_chat_gpt/features/chat/presentation/cubit/chat_conversation/chat_conversation_cubit.dart';
import 'package:flutter_web_chat_gpt/injection_container.dart';

import 'domain/repositories/chat_repository.dart';
import 'domain/usecases/chat_conversation_usecase.dart';

Future<void> chatInjectionContainer() async  {


  sl.registerFactory<ChatConversationCubit>(
        () => ChatConversationCubit(
      chatConversationUseCase: sl.call(),
    ),
  );


  ///useCases
  sl.registerLazySingleton<ChatConversationUseCase>(
          () => ChatConversationUseCase(repository: sl.call()));

  ///Repository
  sl.registerLazySingleton<ChatRepository>(
          () => ChatRepositoryImpl(remoteDataSource: sl.call()));


  ///remote data source
  sl.registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSourceImpl(httpClient: sl.call()),
  );
}
