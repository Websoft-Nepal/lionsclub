import 'package:lionsclub/consts/app_consts.dart';

class AppUrl {
  static var pdfUrl = "https://www.ibm.com/downloads/cas/GJ5QVQ7X";
  static var departmentEndPoint = AppConstants.baseURL + "/department/";
  static var regionDepartmentEndPoint = departmentEndPoint + "/region";
  static var zoneDepartmentEndPoint = departmentEndPoint + "/zone";
  static var clubEndPoint = AppConstants.baseURL + "/club/";
  static var clubMemberEndPoint = clubEndPoint + "/id/member";
  static var donorEndPoint = AppConstants.baseURL + "/donor";
  static var newsEndPoint = AppConstants.baseURL + "/news-events";
  static var programEndPoint = AppConstants.baseURL + "/program";
}
