/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_action_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_action_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberActionFormState extends Equatable {
  const MemberActionFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberActionFormUninitialized extends MemberActionFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MemberActionFormState()''';
  }
}

// MemberActionModel has been initialised and hence MemberActionModel is available
class MemberActionFormInitialized extends MemberActionFormState {
  final MemberActionModel? value;

  @override
  List<Object?> get props => [ value ];

  const MemberActionFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class MemberActionFormError extends MemberActionFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [ message, value ];

  const MemberActionFormError({this.message, MemberActionModel? value }) : super(value: value);

  @override
  String toString() {
    return '''MemberActionFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDMemberActionFormError extends MemberActionFormError { 
  const DocumentIDMemberActionFormError({ String? message, MemberActionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDMemberActionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TextMemberActionFormError extends MemberActionFormError { 
  const TextMemberActionFormError({ String? message, MemberActionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''TextMemberActionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionMemberActionFormError extends MemberActionFormError { 
  const DescriptionMemberActionFormError({ String? message, MemberActionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionMemberActionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ActionMemberActionFormError extends MemberActionFormError { 
  const ActionMemberActionFormError({ String? message, MemberActionModel? value }): super(message: message, value: value);

  @override
  List<Object?> get props => [ message, value ];

  @override
  String toString() {
    return '''ActionMemberActionFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class MemberActionFormLoaded extends MemberActionFormInitialized { 
  const MemberActionFormLoaded({ MemberActionModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''MemberActionFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableMemberActionForm extends MemberActionFormInitialized { 
  const SubmittableMemberActionForm({ MemberActionModel? value }): super(value: value);

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableMemberActionForm {
      value: $value,
    }''';
  }
}


