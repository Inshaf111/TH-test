import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  static handleStatusCode(int code) {
    Map _failiurCodes = {
      401: Unautherized(),
      500: ServerFailure(),
      422: EmailValidationFailiure(),
      404: UserNotFoundFailure()
    };
    if (_failiurCodes.keys.contains(code)) {
      return _failiurCodes[code];
    } else {
      return ServerFailure();
    }
  }

  String displayErrorMessage();
}

// General failures
class ServerFailure extends Failure {
  @override
  displayErrorMessage() {
    return "An error Occured,try again later";
  }
}

class CacheFailure extends Failure {
  @override
  displayErrorMessage() {
    return "An error Occured, try again Later";
  }
}

class UserAlreadyExsist extends Failure {
  @override
  displayErrorMessage() {
    return "User Already Exsist, please login!";
  }
}

class InternetFailure extends Failure {
  @override
  displayErrorMessage() {
    return "You are Offline! please check your internet";
  }
}

class Unautherized extends Failure {
  @override
  displayErrorMessage() {
    return "Incorrect password. Please retry.";
  }
}

class NotFoundFailure extends Failure {
  @override
  displayErrorMessage() {
    return "User not found. Please check and retry";
  }
}

class UserNotFoundFailure extends Failure {
  @override
  displayErrorMessage() {
    return "User ID not found. Please check and retry";
  }
}

class UserLockedFailiure extends Failure {
  @override
  displayErrorMessage() {
    return "User locked, please contact the administrator";
  }
}

class EmailValidationFailiure extends Failure {
  @override
  displayErrorMessage() {
    return "Invalid Email!";
  }
}

class InternetConnectFailure extends Failure {
  @override
  displayErrorMessage() {
    return "You are disconnected from the internet.";
  }
}

class ServerConnectionCancelled extends Failure {
  @override
  displayErrorMessage() {
    return "Connection cancelled";
  }
}
