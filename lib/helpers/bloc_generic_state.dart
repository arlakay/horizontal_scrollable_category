import 'package:learnrxdart/helpers/bloc_event_state.dart';

class BlocGenericState extends BlocState {
  BlocGenericState(
      {this.isBusy: false,
      this.isSuccess: false,
      this.isFailure: false,
      this.errorCode: 0,
      this.errorMessage: "",
      this.err
      });

  final bool isBusy;
  final bool isSuccess;
  final bool isFailure;
  final int errorCode;
  final String errorMessage;
  final Exception err;

  factory BlocGenericState.noAction() {
    return BlocGenericState();
  }

  factory BlocGenericState.busy() {
    return BlocGenericState(
      isBusy: true,
    );
  }

  factory BlocGenericState.success() {
    return BlocGenericState(
      isSuccess: true,
    );
  }

  factory BlocGenericState.failure(String _errMsg) {
    return BlocGenericState(isFailure: true, errorMessage: _errMsg);
  }

  factory BlocGenericState.addfailure(Exception e) {
    return BlocGenericState(isFailure: true, err: e);
  }

}
