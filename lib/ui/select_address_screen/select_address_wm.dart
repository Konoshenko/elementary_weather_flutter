import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/service/address_service.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../app_model.dart';
import '../../main.dart';
import 'select_address_model.dart';
import 'select_address_screen.dart';

class SelectAddressWM
    extends WidgetModel<SelectAddressScreen, SelectAddressModel> {
  TextEditingController controller = TextEditingController();

  ValueListenable<List<Location>> get predictions => model.predictions;

  SelectAddressWM(SelectAddressModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    controller.addListener(onTextChanged);
  }

  void onTextChanged() {
    model.onTextChanged(controller.text);
  }

  void onTapLocation(Location e) {
    model.saveLocation(e);
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => WeatherScreen()));
  }
}

SelectAddressWM createSelectAddressWM(BuildContext _) =>
    SelectAddressWM(SelectAddressModel(AddressService(), getIt<AppModel>()));
