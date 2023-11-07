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

import 'package:eliud_pkg_etc/model/member_action_repository.dart';
import 'package:eliud_pkg_etc/model/member_action_list_event.dart';
import 'package:eliud_pkg_etc/model/member_action_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'member_action_model.dart';

typedef FilterMemberActionModels = List<MemberActionModel?> Function(
    List<MemberActionModel?> values);

class MemberActionListBloc
    extends Bloc<MemberActionListEvent, MemberActionListState> {
  final FilterMemberActionModels? filter;
  final MemberActionRepository _memberActionRepository;
  StreamSubscription? _memberActionsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberActionLimit;

  MemberActionListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required MemberActionRepository memberActionRepository,
      this.memberActionLimit = 5})
      : _memberActionRepository = memberActionRepository,
        super(MemberActionListLoading()) {
    on<LoadMemberActionList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberActionListToState();
      } else {
        _mapLoadMemberActionListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMemberActionListWithDetailsToState();
    });

    on<MemberActionChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberActionListToState();
      } else {
        _mapLoadMemberActionListWithDetailsToState();
      }
    });

    on<AddMemberActionList>((event, emit) async {
      await _mapAddMemberActionListToState(event);
    });

    on<UpdateMemberActionList>((event, emit) async {
      await _mapUpdateMemberActionListToState(event);
    });

    on<DeleteMemberActionList>((event, emit) async {
      await _mapDeleteMemberActionListToState(event);
    });

    on<MemberActionListUpdated>((event, emit) {
      emit(_mapMemberActionListUpdatedToState(event));
    });
  }

  List<MemberActionModel?> _filter(List<MemberActionModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMemberActionListToState() async {
    int amountNow = (state is MemberActionListLoaded)
        ? (state as MemberActionListLoaded).values!.length
        : 0;
    _memberActionsListSubscription?.cancel();
    _memberActionsListSubscription = _memberActionRepository.listen(
        (list) => add(MemberActionListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberActionLimit : null);
  }

  Future<void> _mapLoadMemberActionListWithDetailsToState() async {
    int amountNow = (state is MemberActionListLoaded)
        ? (state as MemberActionListLoaded).values!.length
        : 0;
    _memberActionsListSubscription?.cancel();
    _memberActionsListSubscription = _memberActionRepository.listenWithDetails(
        (list) => add(MemberActionListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberActionLimit : null);
  }

  Future<void> _mapAddMemberActionListToState(AddMemberActionList event) async {
    var value = event.value;
    if (value != null) {
      await _memberActionRepository.add(value);
    }
  }

  Future<void> _mapUpdateMemberActionListToState(
      UpdateMemberActionList event) async {
    var value = event.value;
    if (value != null) {
      await _memberActionRepository.update(value);
    }
  }

  Future<void> _mapDeleteMemberActionListToState(
      DeleteMemberActionList event) async {
    var value = event.value;
    if (value != null) {
      await _memberActionRepository.delete(value);
    }
  }

  MemberActionListLoaded _mapMemberActionListUpdatedToState(
          MemberActionListUpdated event) =>
      MemberActionListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _memberActionsListSubscription?.cancel();
    return super.close();
  }
}
