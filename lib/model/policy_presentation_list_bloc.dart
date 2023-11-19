/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_etc/model/policy_presentation_repository.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_list_event.dart';
import 'package:eliud_pkg_etc/model/policy_presentation_list_state.dart';
import 'package:eliud_core_model/tools/query/query_tools.dart';

import 'policy_presentation_model.dart';

typedef FilterPolicyPresentationModels = List<PolicyPresentationModel?>
    Function(List<PolicyPresentationModel?> values);

class PolicyPresentationListBloc
    extends Bloc<PolicyPresentationListEvent, PolicyPresentationListState> {
  final FilterPolicyPresentationModels? filter;
  final PolicyPresentationRepository _policyPresentationRepository;
  StreamSubscription? _policyPresentationsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int policyPresentationLimit;

  PolicyPresentationListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required PolicyPresentationRepository policyPresentationRepository,
      this.policyPresentationLimit = 5})
      : _policyPresentationRepository = policyPresentationRepository,
        super(PolicyPresentationListLoading()) {
    on<LoadPolicyPresentationList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPolicyPresentationListToState();
      } else {
        _mapLoadPolicyPresentationListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPolicyPresentationListWithDetailsToState();
    });

    on<PolicyPresentationChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPolicyPresentationListToState();
      } else {
        _mapLoadPolicyPresentationListWithDetailsToState();
      }
    });

    on<AddPolicyPresentationList>((event, emit) async {
      await _mapAddPolicyPresentationListToState(event);
    });

    on<UpdatePolicyPresentationList>((event, emit) async {
      await _mapUpdatePolicyPresentationListToState(event);
    });

    on<DeletePolicyPresentationList>((event, emit) async {
      await _mapDeletePolicyPresentationListToState(event);
    });

    on<PolicyPresentationListUpdated>((event, emit) {
      emit(_mapPolicyPresentationListUpdatedToState(event));
    });
  }

  List<PolicyPresentationModel?> _filter(
      List<PolicyPresentationModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadPolicyPresentationListToState() async {
    int amountNow = (state is PolicyPresentationListLoaded)
        ? (state as PolicyPresentationListLoaded).values!.length
        : 0;
    _policyPresentationsListSubscription?.cancel();
    _policyPresentationsListSubscription = _policyPresentationRepository.listen(
        (list) => add(PolicyPresentationListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!)
            ? pages * policyPresentationLimit
            : null);
  }

  Future<void> _mapLoadPolicyPresentationListWithDetailsToState() async {
    int amountNow = (state is PolicyPresentationListLoaded)
        ? (state as PolicyPresentationListLoaded).values!.length
        : 0;
    _policyPresentationsListSubscription?.cancel();
    _policyPresentationsListSubscription =
        _policyPresentationRepository.listenWithDetails(
            (list) => add(PolicyPresentationListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * policyPresentationLimit
                : null);
  }

  Future<void> _mapAddPolicyPresentationListToState(
      AddPolicyPresentationList event) async {
    var value = event.value;
    if (value != null) {
      await _policyPresentationRepository.add(value);
    }
  }

  Future<void> _mapUpdatePolicyPresentationListToState(
      UpdatePolicyPresentationList event) async {
    var value = event.value;
    if (value != null) {
      await _policyPresentationRepository.update(value);
    }
  }

  Future<void> _mapDeletePolicyPresentationListToState(
      DeletePolicyPresentationList event) async {
    var value = event.value;
    if (value != null) {
      await _policyPresentationRepository.delete(value);
    }
  }

  PolicyPresentationListLoaded _mapPolicyPresentationListUpdatedToState(
          PolicyPresentationListUpdated event) =>
      PolicyPresentationListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _policyPresentationsListSubscription?.cancel();
    return super.close();
  }
}
