import 'package:flutter/material.dart';
import 'package:payflowprevious/shared/models/boleto_model.dart';
import 'package:payflowprevious/shared/widgets/boleto_tile/boleto_tile_widget.dart';

import 'boleto_list_controller.dart';

class BoletoListWidget extends StatefulWidget {
  BoletoListWidget({Key? key}) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  final controller = BoletoListController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: controller.boletosNotifier,
        builder: (_, boletos, __) => Column(
            children: boletos
                .map(
                  (e) => BoletoTileWidget(data: e),
                )
                .toList()));
  }
}
