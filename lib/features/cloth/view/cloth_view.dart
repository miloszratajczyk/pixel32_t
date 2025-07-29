import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/cubit/cloth_cubit.dart';

class ClothView extends StatelessWidget {
  const ClothView({super.key});

  @override
  Widget build(BuildContext context) {
    final image = context.watch<ClothCubit>().state;
    if (image == null) {
      return CircularProgressIndicator();
    }
    return RawImage(
      image: image,
      scale: 1.0,
      filterQuality: FilterQuality.none,
    );
  }
}
