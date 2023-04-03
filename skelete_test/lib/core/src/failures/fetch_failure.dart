part of 'failure.dart';

abstract class FetchFailure extends Failure {
  const FetchFailure();

  TResult fold<TResult>({
    required TResult Function(LocalFetchFailure failure) local,
    required TResult Function(RemoteFetchFailure failre) remote,
  });
}

abstract class LocalFetchFailure extends FetchFailure {
  const LocalFetchFailure();

  const factory LocalFetchFailure.unknown({
    FailureInformation? info,
  }) = UnknownLocalFetchFailure;

  const factory LocalFetchFailure.notFound() = _$NotFoundLocalFetchFailure;

  TResult when<TResult>({
    required TResult Function(FailureInformation? info) unknown,
    required TResult Function() notFound,
  });

  @override
  TResult fold<TResult>({
    required TResult Function(LocalFetchFailure failure) local,
    required TResult Function(RemoteFetchFailure failure) remote,
  }) {
    return local(this);
  }
}

class UnknownLocalFetchFailure extends LocalFetchFailure {
  const UnknownLocalFetchFailure({
    FailureInformation? info,
  }) : _info = info;

  final FailureInformation? _info;

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation? info) unknown,
    required TResult Function() notFound,
  }) {
    return unknown(_info);
  }
}

class _$NotFoundLocalFetchFailure extends LocalFetchFailure {
  const _$NotFoundLocalFetchFailure();

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation info) unknown,
    required TResult Function() notFound,
  }) {
    return notFound();
  }
}

abstract class RemoteFetchFailure extends FetchFailure {
  const RemoteFetchFailure();

  const factory RemoteFetchFailure.notFound() = _$NotFoundRemoteFetchFailure;
  const factory RemoteFetchFailure.unknown({
    required FailureInformation info,
  }) = _$UnknownRemoteFetchFailure;
  const factory RemoteFetchFailure.timeout() = _$TimeoutRemoteFetchFailure;
  const factory RemoteFetchFailure.noInternet() =
      _$NoInternetRemoteFetchFailure;
  const factory RemoteFetchFailure.badResponse(
    BadResponseInformation responseInfo,
  ) = _$BadResponseRemoteFetchFailure;

  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
    required TResult Function(BadResponseInformation responseInfo) badResponse,
  });

  @override
  TResult fold<TResult>({
    required TResult Function(LocalFetchFailure failure) local,
    required TResult Function(RemoteFetchFailure failre) remote,
  }) {
    return remote(this);
  }
}

class _$UnknownRemoteFetchFailure extends RemoteFetchFailure {
  const _$UnknownRemoteFetchFailure({
    required FailureInformation info,
  }) : _info = info;

  final FailureInformation _info;

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
    required TResult Function(BadResponseInformation responseInfo) badResponse,
  }) {
    return unknown(_info);
  }
}

class FailureInformation {
  const FailureInformation({
    required this.error,
    required this.trace,
  });

  final Exception error;
  final StackTrace trace;
}

class _$NotFoundRemoteFetchFailure extends RemoteFetchFailure {
  const _$NotFoundRemoteFetchFailure();

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
    required TResult Function(BadResponseInformation responseInfo) badResponse,
  }) {
    return notFound();
  }
}

class _$TimeoutRemoteFetchFailure extends RemoteFetchFailure {
  const _$TimeoutRemoteFetchFailure();

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
    required TResult Function(BadResponseInformation responseInfo) badResponse,
  }) {
    return timeout();
  }
}

class _$NoInternetRemoteFetchFailure extends RemoteFetchFailure {
  const _$NoInternetRemoteFetchFailure();

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
    required TResult Function(BadResponseInformation responseInfo) badResponse,
  }) {
    return noInternet();
  }
}

class _$BadResponseRemoteFetchFailure extends RemoteFetchFailure {
  const _$BadResponseRemoteFetchFailure(this.responseInformation);

  final BadResponseInformation responseInformation;

  @override
  TResult when<TResult>({
    required TResult Function(FailureInformation f) unknown,
    required TResult Function() notFound,
    required TResult Function() timeout,
    required TResult Function() noInternet,
    required TResult Function(BadResponseInformation responseInfo) badResponse,
  }) {
    return badResponse(responseInformation);
  }
}

class BadResponseInformation {
  const BadResponseInformation({
    required this.code,
    required this.message,
  });

  final int? code;
  final String? message;
}
