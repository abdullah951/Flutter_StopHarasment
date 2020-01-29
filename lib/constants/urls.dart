 class Urls {
   //static const String url = "http://ec2-18-223-107-103.us-east-2.compute.amazonaws.com:8082/api/";

   static const String url="http://192.168.100.12:8082/api/";
   static const String add_incident = url + "Incident/Add";
   static const String GetCategory = url + "Category/Get";
   static const String NEW_INCIDENT_STATUS = "created";
   static const String checkItem = url + "Category/Check";
 }
 class Screens{

   static const String GetCategoryScreen = "GetCategory";
   static const String GetSubCategoryScreen = "GetSubCategoryByCategory";
   static const String GetItemScreen = "GetItemBySubCategory";

   static const String CheckCategoryScreen = "GetCategoryById";
   static const String CheckSubCategoryScreen = "GetSubCategoryById";
   static const String CheckItemScreen = "GetSubCategoryItemById";




}
class GetParameters{
  static const String Screen = "screen";
  static const String Name = "Name";
  static const String Id = "id";
  static const String Status = "status";

}