import 'package:bikes_shop/app/ui/common/loading_widget.dart';
import 'package:bikes_shop/domain/models/response.dart';
import 'package:flutter/material.dart';

typedef BikeBuilder<T> = Widget Function(T data);
typedef MapTo<T> = T Function(IResponse data);

class MyFutureBuilderComponent<T> extends StatelessWidget {
  final BikeBuilder<T> builder;
  final Widget? errorWidget;
  final Widget? loading;
  final Future<IResponse> future;
  final MapTo<T> mapTo;

  MyFutureBuilderComponent({
    required this.future,
    required this.builder,
    required this.mapTo,
    this.loading,
    this.errorWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<IResponse>(
      future: this.future,
      builder: (ctx, AsyncSnapshot<IResponse> snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return this.loading ?? LoadingWidget();
        } else if (snap.connectionState == ConnectionState.done) {
          if (snap.hasData) {
            final data = snap.data;
            if ((data is ErrorResponse)) {
              return this.errorWidget ?? Text("${data.error}");
            }
           return  this.builder(mapTo(snap.data!));
          }
          return this.errorWidget ?? Text("error1");
        }
        return this.errorWidget ?? Text("error2");
      },
    );
  }
}
