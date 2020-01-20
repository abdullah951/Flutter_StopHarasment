 class Urls {
   static const String url = "http://ec2-18-223-107-103.us-east-2.compute.amazonaws.com:8082/api/";

   //public static final String url="http://192.168.100.19:8082/api/";
   static const String add_incident = url + "Incident/Add";
   static const String GetCategory = url + "Category/Get";
   static const String NEW_INCIDENT_STATUS = "created";
   static const String checkItem = url + "Category/Check";
 }
 class Screens{

   static const String GetCategoryScreen = "GetCategory";
   static const String GetSubCategoryScreen = "GetSubCategoryByCategory";
   static const String GetItemScreen = "GetItemBySubCategory";
   static const String CheckCategoryScreen = "CheckCategoryById";
   static const String CheckSubCategoryScreen = "";
   static const String CheckItemScreen = "CheckSubCheckSubCategoryByIdCategoryItemById";




}
class GetParameters{
  static const String Screen = "screen";
  static const String Name = "Name";
  static const String Id = "id";
  static const String Status = "status";

}