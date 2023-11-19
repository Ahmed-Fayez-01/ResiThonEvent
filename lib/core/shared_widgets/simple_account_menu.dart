import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';

import 'arrow_clipper.dart';

class SimpleAccountMenu extends StatefulWidget {
  final List<Widget> iconsText;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final ValueChanged<int> onChange;

  const SimpleAccountMenu({
    Key? key,
    required this.iconsText,
    this.borderRadius,
    this.backgroundColor = const Color(0xFFD26324),
    this.iconColor = Colors.white,
    required this.onChange,
  })  : assert(iconsText != null),
        super(key: key);

  @override
  _SimpleAccountMenuState createState() => _SimpleAccountMenuState();
}

class _SimpleAccountMenuState extends State<SimpleAccountMenu>
    with SingleTickerProviderStateMixin {
  late GlobalKey _key;
  bool isMenuOpen = false;
  late Offset buttonPosition;
  late Size buttonSize;
  bool buttonTap=false;
  late OverlayEntry _overlayEntry;
  late BorderRadius _borderRadius;

  @override
  void initState() {
    _borderRadius = widget.borderRadius!;
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (tap){
        buttonTap=true;
      },
      onTapOutside: (tap){
        buttonTap=false;
      },
      child: Container(
        key: _key,
        decoration: BoxDecoration(
          color: AppColors.primarySwatchColor,
          borderRadius: _borderRadius,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.height*.05,
          height: MediaQuery.of(context).size.height*.05,
          child: InkWell(
            onTap: () {
              if (isMenuOpen) {
                closeMenu();
              } else {
                openMenu();
              }
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.language,color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx,
          width: buttonSize.width,
          child: TapRegion(
            onTapOutside: (tap) {
              if(buttonTap)
              {

              }else{
                closeMenu();
              }
            },
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipPath(
                      clipper: ArrowClipper(),
                      child: Container(
                        width: MediaQuery.of(context).size.height*.019,
                        height: MediaQuery.of(context).size.height*.019,
                        color: widget.backgroundColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.017,),
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: _borderRadius,
                      ),
                      child: Column(
                        children: List.generate(widget.iconsText.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              widget.onChange(index);
                              closeMenu();
                            },
                            child: SizedBox(
                              child: widget.iconsText[index],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
