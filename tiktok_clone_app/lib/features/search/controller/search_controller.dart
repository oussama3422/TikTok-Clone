

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/features/search/repository/search_repository.dart';

final searchControllerProvider = Provider((ref) {
  return SearchController(ref.watch(searchRepositoryProvider));
});



class SearchController{
  SearchRepository searchRepository;
  SearchController(this.searchRepository);
  

   // search fro users Method
  searchUser(String typeUser)async{
    return searchRepository.searchUser(typeUser);
  }

}