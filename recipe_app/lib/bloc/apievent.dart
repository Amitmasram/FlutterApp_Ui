import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable{
  const ApiEvent();

  @override
  List<Object> get props => [];
}

class GetApiEvent extends ApiEvent{
  final String query;

  const GetApiEvent({this.query = ''});
  
  GetApiEvent copyWith({String? query}){
    return GetApiEvent(query: query ?? '');
  }
  
  @override
  List<Object> get props => [query];
}

class GetRecipeEvent extends ApiEvent{
  final int id;

  const GetRecipeEvent({this.id = 0});

  GetRecipeEvent copywith({int? id}){
    return GetRecipeEvent(
      id: id ?? 0
    );
  }

  @override
  List<Object> get props => [id];
}

class FindRecipeEvent extends ApiEvent{
  final String data;

  const FindRecipeEvent({this.data = ''});

  FindRecipeEvent copywith({String? data}){
    return FindRecipeEvent(
      data: data ?? ''
    );
  }

  @override
  List<Object> get props => [data];
}
// this event doesn't have any value it is made for clearing the findrecipestate by giving empty list []
class ClearEvent extends ApiEvent{}