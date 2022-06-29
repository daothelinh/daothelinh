import 'package:flutter_flavor/flutter_flavor.dart';
 
class Endpoints {
  Endpoints._();
 
  static String baseUrl = FlavorConfig.instance.variables['url'];
 
  static String login = baseUrl + '/assessors/login';
  static String register = baseUrl + '/assessors/register';
  static String checkExisted = baseUrl + '/assessors/check-existed';
  static String filterFolder = baseUrl + '/folders/filter';
  static String addFolder = baseUrl + '/folders';
  static String editFolder(String id) => baseUrl + '/folders/$id';
  static String deleteFolder(String id) => baseUrl + '/folders/$id';
  static String getUploadUrl = baseUrl + '/images/url';
  static String addImage = baseUrl + '/images/';
  static String getVehiclePart(String directionId) =>
      baseUrl + '/part-directions/$directionId/carparts';
  static String getPartDirections = baseUrl + '/part-directions';
  static String getDamageTypes = baseUrl + '/damage-types';
  static String changePassword = baseUrl + '/assessors/change-password';
  static String filterImage(String id) => baseUrl + '/images/filter/$id';
  static String getFoldersFromServer(String id) =>
      baseUrl + '/folders/$id/categories';
  // baseUrl + '/folders/$id/all-images';
 
  static String uploadFolders = baseUrl + '/categories/';
  static String deleteCategories(String id) =>
      baseUrl + '/folders/$id/categories';
  static String deleteCategoriesDetail(String id) =>
      baseUrl + '/categories/$id';
  //New-Flow-Upload-Image
  static String uploadImages = baseUrl + '/images';
  static String uploadMasks(int id) => baseUrl + '/images/$id/masks';
  static String deleteImg(int id) => baseUrl + '/images/$id';
 
  // Claim - Test Engine Mode
  static String getClaims = baseUrl + '/claimfolders/filter';
  static String getVehicleBrands = baseUrl + '/carbrands';
  static String addNewClaim = baseUrl + '/claimfolders';
  static String editClaim(String id) => baseUrl + '/claimfolders/$id';
  static String deleteClaim(String id) => baseUrl + '/claimfolders/$id';
  static String getUpLoadUrlForClaim = baseUrl + '/images/url';
  static String addImageToClaim = baseUrl + '/claimimages';
  static String deleteImageInCLaim(String imageID) =>
      baseUrl + '/claimimages/$imageID';
  static String getAllImageInClaim(String claimID) =>
      baseUrl + '/claimimages/all/$claimID';
  static String getAllImageInClaimDev(String claimID) =>
      baseUrl + '/claimimages/all/$claimID';
  static String deleteAllImageInClaim(String claimID) =>
      baseUrl + '/claimimages/all/$claimID';
 
  static String callEngine = baseUrl + '/claimimages/run_engine';
 
  // AI mode
  static String callEngineAfterTakePhoto =
      baseUrl + '/claimimages/damage-assessment';
  static String callEngineAfterUserEdit(String imageId) =>
      baseUrl + '/claimimages/$imageId/damage-reassessment';
  static String getDamageResult(String id) =>
      baseUrl + '/claimfolders/results/$id';
  static String runEnginePercent =
      baseUrl + '/claimimages/run_engine_percentage/';
  static String reportImage(String imageId) =>
      baseUrl + '/claimimages/$imageId/report';
}
