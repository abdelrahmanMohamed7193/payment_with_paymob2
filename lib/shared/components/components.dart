
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

navigateAndFinish({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) => false,
    );

navigateTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget myDefaultTextButton({
  required void Function()? function,
  required String text,
  Color color = defaultColor,
  double ?textsize
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(color: color ,fontSize: textsize),
      ),
    );

Widget myTextField({
  required BuildContext context,
  IconData? prefixIcon,
  required Function onTap,
  // required Function validator ,
  required String validateText,
  required Function onChanged,
  required TextEditingController controller,
  required String label,
  IconData? suffixIcon,
  Function? SuffixPressed,
  TextInputType? type,
  bool readonly = false,
  bool isPassword = false,
  double suffixSize = 15,
  double prefixSize = 15,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(

          onTap: () {
            onTap();
          },
          decoration: InputDecoration(
            label: Text(
              label,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12),
            ),
            prefixIcon: Icon(
              prefixIcon,
              size: prefixSize,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                SuffixPressed!();
              },
              icon: Icon(
                suffixIcon,
                size: suffixSize,
              ),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:BorderSide(color: Theme.of(context).primaryColor)  ,

            ),
          ),
          readOnly: readonly,
          validator: (value) {
            if (value!.isEmpty) {
              return (validateText);
            }
            return null;
          },
          obscureText: isPassword,
          onChanged: onChanged(),
          controller: controller,
          keyboardType: type,



        ),
      ),
    );

Widget myButton({
  required String text,
  required VoidCallback onTap,
  double? width = double.infinity,
  double? height = 45.0,
  BuildContext? context ,
  Color? color ,
  Color? textcolor =Colors.white ,
  double textSize =18.0,
  double radius =0.0 ,
}) =>
    GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color ,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: width,
        height: height,
        child: MaterialButton(
          onPressed: onTap,
          child: Text(
            text ,
            style: TextStyle(color: Colors.white),

          ),

        )
      ),
    );










// void showToast({
//   required dynamic text,
//   required ToastStates state,
// }) =>
//     Fluttertoast.showToast(
//         msg: text,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 5,
//         backgroundColor: ChooseToastColor(state),
//         textColor: Colors.white,
//         fontSize: 16.0);
//
// enum ToastStates { SUCCESS, ERROR, WARNING }
//
// Color ChooseToastColor(ToastStates state) {
//   Color? color;
//   switch (state) {
//     case ToastStates.SUCCESS:
//       color = Colors.green;
//       break;
//     case ToastStates.ERROR:
//       color = Colors.red;
//       break;
//     case ToastStates.WARNING:
//       color = Colors.amber;
//       break;
//   }
//   return color;
// }

// MaterialColor buildMaterialColor(Color color) {
//   List strengths = <double>[.05];
//   Map<int, Color> swatch = {};
//   final int r = color.red, g = color.green, b = color.blue;
//
//   for (int i = 1; i < 10; i++) {
//     strengths.add(0.1 * i);
//   }
//   strengths.forEach((strength) {
//     final double ds = 0.5 - strength;
//     swatch[(strength * 1000).round()] = Color.fromRGBO(
//       r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//       g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//       b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//       1,
//     );
//   });
//   return MaterialColor(color.value, swatch);
// }

//

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
  Color ?iconColor ,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new ,color: iconColor,),
      ),
      titleSpacing: 2.0,
      title: Text(
        title!,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: actions,
    );

Widget buildDrawerListItem({
  required BuildContext context ,
  required IconData leadingIcon,
  required String title,
  Widget? trailing,
  Function()? onTap,
  Color? color,
}) {
  return ListTile(
    leading: Icon(
      leadingIcon,
      color: color ?? Colors.blue,
    ),
    title: Text(
      title ,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 17 ,),),
    trailing: trailing ??= Icon(
      Icons.arrow_right,
      color: color,
    ),
    onTap: onTap,
  );
}

Widget buildMyDividerOfListItem({Color? color ,double? height=0,double? thickness=1}) {
  return Divider(
    height: height,
    thickness: thickness,
    indent: 18,
    endIndent: 24,
    color: color ,

  );
}

// Future<void> launchURL(String url) async {
//   final siteUrl = Uri.parse(url);
//   if (await canLaunchUrl(siteUrl)) {
//     launchUrl(siteUrl, mode: LaunchMode.externalApplication);
//   } else {
//     print('Can Not Launch $siteUrl');
//   }
// }
//
// Widget buildIcon(IconData icon, url, iconColor) {
//   return InkWell(
//     onTap: () => launchURL(url),
//     child: Icon(
//       icon,
//       color: iconColor,
//       size: 35,
//     ),
//   );
// }
//
// Widget buildSocialMediaIcons() {
//   return Padding(
//     padding: EdgeInsetsDirectional.only(start: 16),
//     child: Row(
//       children: [
//         buildIcon(
//           FontAwesomeIcons.squareFacebook,
//           'https://www.facebook.com/profile.php?id=100007716162910' ,
//           Colors.blue ,
//
//         ),
//         SizedBox(
//           width: 15,
//         ),
//         buildIcon(FontAwesomeIcons.linkedinIn,
//           'https://www.linkedin.com/in/abdelrahman-mohamed-88ab7923a/',
//           Colors.blue ,
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         buildIcon(
//           FontAwesomeIcons.whatsapp,
//           '',
//           Colors.green ,
//         ),
//       ],
//     ),
//   );
// }
//
// Widget buildProductItemAdmin(
//     context,
//     String image,
//     String name,
//     String description ,
//     ) =>
//     Dismissible(
//       key: Key(''),
//       direction:DismissDirection.horizontal,
//       background: Icon(Icons.delete ,color: Colors.red,size: 45),
//
//       child: GestureDetector(
//         onTapUp: (details){
//           double dx =details.globalPosition.dx ;
//           double dy =details.globalPosition.dy ;
//           double dx2 =MediaQuery.of(context).size.width-dx;
//           double dy2 =MediaQuery.of(context).size.width-dy;
//           showMenu(
//             context: context,
//             position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
//             items: [
//               MyPopupMenuItem(
//                 child: Text('delete'),
//               ) ,
//
//               PopupMenuItem(child:Text('Delet Product') ) ,
//             ] ,
//           ) ;
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Container(
//             height: 160,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.network(image ,width: 200 ,height: 130,) ,
//                 const SizedBox(
//                   width: 20.0,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name,
//                         // maxLines: 2,
//                         // overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       SizedBox(height: 10.0,) ,
//                       Text(
//                         description,
//                         // maxLines: 2,
//                         // overflow: TextOverflow.ellipsis,
//                         style: TextStyle(color: Colors.blueGrey ,fontSize: 16),
//
//                       ),
//                       const Spacer(),
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: CircleAvatar(
//                               radius: 16.0,
//                               backgroundColor: defaultColor.withOpacity(0.9) ,
//                               child:  Icon(
//                                 Icons.favorite_border,
//                                 size: 18.0,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 40,),
//                           IconButton(
//                             onPressed: () {
//                               // AdminCubit.get(context).deleteProduct(AdminCubit.get(context).products[index].);
//                             },
//                             icon: CircleAvatar(
//                               radius: 16.0,
//                               backgroundColor: Colors.red.withOpacity(0.1) ,
//                               child:  Icon(
//                                 Icons.delete,
//                                 size: 22.0,
//                                 color: Colors.redAccent,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

Widget buildProductItemUser(
    context,
    String image,
    String name,
    String description ,
    ) =>
    GestureDetector(
      // onTapUp: (details){
      //   double dx =details.globalPosition.dx ;
      //   double dy =details.globalPosition.dy ;
      //   double dx2 =MediaQuery.of(context).size.width-dx;
      //   double dy2 =MediaQuery.of(context).size.width-dy;
      //   showMenu(
      //     context: context,
      //     position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
      //     items: [
      //       MyPopupMenuItem(
      //         child: Text('delete'),
      //       ) ,
      //
      //       PopupMenuItem(child:Text('Delet Product') ) ,
      //     ] ,
      //   ) ;
      // },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 160,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(image ,width: 200 ,height: 130,) ,
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10.0,) ,
                    Text(
                      description,
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.blueGrey ,fontSize: 16),

                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            radius: 16.0,
                            backgroundColor: defaultColor.withOpacity(0.9) ,
                            child:  Icon(
                              Icons.favorite_border,
                              size: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 40,),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: CircleAvatar(
                        //     radius: 16.0,
                        //     backgroundColor: Colors.red.withOpacity(0.1) ,
                        //     child:  Icon(
                        //       IconBroken.Delete,
                        //       size: 22.0,
                        //       color: Colors.redAccent,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );


