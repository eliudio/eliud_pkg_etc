/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_presentation_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'policy_presentation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PolicyPresentationFormState extends Equatable {
  const PolicyPresentationFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PolicyPresentationFormUninitialized extends PolicyPresentationFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PolicyPresentationFormState()''';
  }
}

// PolicyPresentationModel has been initialised and hence PolicyPresentationModel is available
class PolicyPresentationFormInitialized extends PolicyPresentationFormState {
  final PolicyPresentationModel? value;

  @override
  List<Object?> get props => [value];

  const PolicyPresentationFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PolicyPresentationFormError
    extends PolicyPresentationFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PolicyPresentationFormError({this.message, super.value});

  @override
  String toString() {
    return '''PolicyPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPolicyPresentationFormError
    extends PolicyPresentationFormError {
  const DocumentIDPolicyPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPolicyPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdPolicyPresentationFormError extends PolicyPresentationFormError {
  const AppIdPolicyPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdPolicyPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionPolicyPresentationFormError
    extends PolicyPresentationFormError {
  const DescriptionPolicyPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionPolicyPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PoliciesPolicyPresentationFormError extends PolicyPresentationFormError {
  const PoliciesPolicyPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PoliciesPolicyPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsPolicyPresentationFormError
    extends PolicyPresentationFormError {
  const ConditionsPolicyPresentationFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsPolicyPresentationFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PolicyPresentationFormLoaded extends PolicyPresentationFormInitialized {
  const PolicyPresentationFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PolicyPresentationFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePolicyPresentationForm
    extends PolicyPresentationFormInitialized {
  const SubmittablePolicyPresentationForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePolicyPresentationForm {
      value: $value,
    }''';
  }
}
