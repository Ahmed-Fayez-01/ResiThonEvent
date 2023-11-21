import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/orginizer/home/presentation/views/organizer_home_view.dart';
import 'package:resithon_event/features/orginizer/scan_qr/presentation/view_models/scan_cubit/scan_cubit.dart';
import 'package:resithon_event/features/orginizer/scan_qr/presentation/views/widgets/acceptabale_pop_up.dart';

import '../../../../../core/utils/constants.dart';

class ScanQrPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
  const ScanQrPage({super.key, required this.sessionId});
  final int sessionId;
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    print(this.controller);
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() => result = scanData);
      if (result != null) {
        context.read<ScanCubit>().scanUser(data: {
          "code":result!.code,
          "session_id":widget.sessionId
        });
        AcceptablePopUp(
            context: context,
            button: DefaultButton(
                borderRadius: AppConstants.sp10(context),
                onPress: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => ScanQrPage(sessionId: widget.sessionId,)));
            }, text: "Okay"), sessionId: widget.sessionId);

        // Future.delayed(const Duration(milliseconds: 3000), () {
        //   setState(() {
        //
        //   });
        // });
      }
    });
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (result != null) {
      controller!.pauseCamera();
      print(result!.code);
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    readQr();
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OrganizerHomeView()));
        return true;
      },
      child: Scaffold(
        body: QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: AppColors.primarySwatchColor,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 250,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
