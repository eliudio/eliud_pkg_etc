/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_etc/model/member_action_repository.dart';
import 'package:eliud_pkg_etc/model/member_action_list_event.dart';
import 'package:eliud_pkg_etc/model/member_action_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _memberActionLimit = 5;

class MemberActionListBloc extends Bloc<MemberActionListEvent, MemberActionListState> {
  final MemberActionRepository _memberActionRepository;
  StreamSubscription? _memberActionsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  MemberActionListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required MemberActionRepository memberActionRepository})
      : assert(memberActionRepository != null),
        _memberActionRepository = memberActionRepository,
        super(MemberActionListLoading());

  Stream<MemberActionListState> _mapLoadMemberActionListToState() async* {
    int amountNow =  (state is MemberActionListLoaded) ? (state as MemberActionListLoaded).values!.length : 0;
    _memberActionsListSubscription?.cancel();
    _memberActionsListSubscription = _memberActionRepository.listen(
          (list) => add(MemberActionListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _memberActionLimit : null
    );
  }

  Stream<MemberActionListState> _mapLoadMemberActionListWithDetailsToState() async* {
    int amountNow =  (state is MemberActionListLoaded) ? (state as MemberActionListLoaded).values!.length : 0;
    _memberActionsListSubscription?.cancel();
    _memberActionsListSubscription = _memberActionRepository.listenWithDetails(
            (list) => add(MemberActionListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _memberActionLimit : null
    );
  }

  Stream<MemberActionListState> _mapAddMemberActionListToState(AddMemberActionList event) async* {
    var value = event.value;
    if (value != null) 
      _memberActionRepository.add(value);
  }

  Stream<MemberActionListState> _mapUpdateMemberActionListToState(UpdateMemberActionList event) async* {
    var value = event.value;
    if (value != null) 
      _memberActionRepository.update(value);
  }

  Stream<MemberActionListState> _mapDeleteMemberActionListToState(DeleteMemberActionList event) async* {
    var value = event.value;
    if (value != null) 
      _memberActionRepository.delete(value);
  }

  Stream<MemberActionListState> _mapMemberActionListUpdatedToState(
      MemberActionListUpdated event) async* {
    yield MemberActionListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<MemberActionListState> mapEventToState(MemberActionListEvent event) async* {
    if (event is LoadMemberActionList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadMemberActionListToState();
      } else {
        yield* _mapLoadMemberActionListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadMemberActionListWithDetailsToState();
    } else if (event is AddMemberActionList) {
      yield* _mapAddMemberActionListToState(event);
    } else if (event is UpdateMemberActionList) {
      yield* _mapUpdateMemberActionListToState(event);
    } else if (event is DeleteMemberActionList) {
      yield* _mapDeleteMemberActionListToState(event);
    } else if (event is MemberActionListUpdated) {
      yield* _mapMemberActionListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _memberActionsListSubscription?.cancel();
    return super.close();
  }
}


