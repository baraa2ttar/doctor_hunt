import '../../../../core/exports/ui_exports.dart';

class AddMore extends StatelessWidget {
  const AddMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 125,

      decoration: BoxDecoration(

          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          color: AppColor.lightgreenColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(Icons.add, size: 50,color: AppColor.primaryColor,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text( "Add more images ",textAlign: TextAlign.center,style: TextStyle(color: AppColor.primaryColor,fontSize: 16),),
          )
        ],),
    );
  }
}
