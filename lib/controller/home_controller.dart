import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:login_ui_aicycle_seta/data/auth_res.dart';
import 'package:login_ui_aicycle_seta/services/local_storage_service.dart';
import 'package:login_ui_aicycle_seta/services/process_usecase.dart';
import 'package:login_ui_aicycle_seta/services/snackbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum AppMode { testEngine, collectData }

class HomeController extends GetxController {
  // final DoFilterFolder doFilterFolder;
  // final AddFolder addFolder;
  // final EditFolder editFolder;
  // final DeleteFolder deleteFolder;
  // final GetClaims getClaims;
  // final GetVehicleBrands getVehicleBrands;
  // final DeleteClaim deleteClaim;
  // final AddNewClaim addNewClaim;
  // final EditClaim editClaim;

  // HomeController({
  //   required this.doFilterFolder,
  //   required this.addFolder,
  //   required this.editFolder,
  //   required this.deleteFolder,
  //   // required this.changePassword,
  //   required this.getClaims,
  //   required this.getVehicleBrands,
  //   required this.deleteClaim,
  //   required this.addNewClaim,
  //   required this.editClaim,
  // });
  // late RefreshController folderRefreshCtrl;
  // int pageIndex = 1;
  // int pageSize = 9;

  // final filterItems = [
  //   'Hồ sơ của tôi',
  //   'Tất cả hồ sơ cùng khu vực',
  //   'Tất cả hồ sơ'
  // ];
  // final sortItems = ['mới nhất', 'cũ nhất'];
  // TextEditingController createFolderController = TextEditingController();

  // // Rx<String?> vehicleBrand;
  // var folderId = ''.obs;

  // var searchValue = ''.obs;
  // var filterValue = ''.obs;
  // var sortValue = ''.obs;
  // var filterLoading = false.obs;

  // var folderRes = <FolderRes>[].obs;
  // var filterFolderRes = <FilterFolderRes>[].obs;

  // // test engine mode
  // var claimList = <Claim>[].obs;
  // var vehicleBrandList = <VehicleBrands>[].obs;
  // int claimPageIndex = 1;

  // late TextEditingController claimNameController;
  // late TextEditingController licenseController;

  // late Rx<String?> vehicleBrandName;
  // late Rx<String?> vehicleBrandId;
  // // end test engine

  // late Rx<AppMode> appMode;
  // Rx<String> appModeToString = Rx<String>('Test Engine');

  // @override
  // void onInit() {
  //   super.onInit();
  //   folderRefreshCtrl = RefreshController();
  //   // Default is test engine mode
  //   claimNameController = TextEditingController();
  //   licenseController = TextEditingController();
  //   vehicleBrandName = Rx<String?>(null);
  //   vehicleBrandId = Rx<String?>(null);
  //   if (FlavorConfig.instance.variables['mode'] == 'ai') {
  //     appMode = Rx<AppMode>(AppMode.testEngine);
  //   } else {
  //     appMode = Rx<AppMode>(AppMode.collectData);
  //   }
  //   applyMode();

  //   if (appMode.value == AppMode.testEngine) {
  //     doGetClaims();
  //   } else {
  //     doFilterbyClass(filterItems[0], sortItems[0], searchValue.value);
  //   }

  //   doGetVehicleBrands();
  //   //end test engine
  //   filterValue.value = filterItems[0];
  //   sortValue.value = sortItems[0];
  //   // doFilterbyClass(filterItems[0], sortItems[0], searchValue.value);

  //   appMode.listen((mode) {
  //     if (mode == AppMode.testEngine) {
  //       doGetClaims();
  //     } else {
  //       doFilterbyClass(filterItems[0], sortItems[0], searchValue.value);
  //     }
  //   });
  // }

  // // test engine mode
  // void doGetClaims() async {
  //   claimPageIndex = 1;
  //   AssessorInfo? currentUser = LocalStorageService().userInfo;
  //   if (currentUser != null) {
  //     var result = await getClaims(
  //       userIds: [int.parse(currentUser.assessorId!)],
  //       pageIndex: claimPageIndex,
  //       pageSize: pageSize,
  //     );

  //     processUsecaseResult(
  //       result: result,
  //       isRefreshing: true,
  //       refreshController: folderRefreshCtrl,
  //       onSuccess: (claims) {
  //         if (claims is List<Claim>) {
  //           claimList.assignAll(claims);
  //         }
  //       },
  //       shouldShowFailure: (p0) => true,
  //     );
  //   }
  // }

  // void doGetVehicleBrands() async {
  //   var result = await getVehicleBrands();

  //   processUsecaseResult(
  //     result: result,
  //     isRefreshing: true,
  //     refreshController: folderRefreshCtrl,
  //     onSuccess: (claims) {
  //       vehicleBrandList.addAll(claims);
  //     },
  //     shouldShowFailure: (p0) => true,
  //   );
  // }

  // void loadMoreClaims() async {
  //   claimPageIndex++;
  //   AssessorInfo? currentUser = LocalStorageService().userInfo;
  //   if (currentUser != null) {
  //     var result = await getClaims(
  //       userIds: [int.parse(currentUser.assessorId!)],
  //       pageIndex: claimPageIndex,
  //       pageSize: pageSize,
  //     );

  //     processUsecaseResult(
  //       result: result,
  //       isRefreshing: false,
  //       refreshController: folderRefreshCtrl,
  //       onSuccess: (claims) {
  //         if (claims is List<Claim>) {
  //           claimList.addAll(claims);
  //         }
  //       },
  //       shouldShowFailure: (p0) => true,
  //     );
  //   }
  // }

  // void doDeleteClaim(String claimId) async {
  //   var result = await deleteClaim(claimId: claimId);
  //   processUsecaseResult(
  //     result: result,
  //     onSuccess: (value) {
  //       doGetClaims();
  //       Snackbar.show(
  //           type: SnackbarType.success, message: 'Xoá hồ sơ thành công');
  //     },
  //     shouldShowFailure: (p0) => true,
  //   );
  // }

  // void onDeleteClaimTapped(String claimId) async {
  //   bool? confirm = await ConfirmDialog.show(
  //     content: 'Bạn chắc chắn xoá hồ sơ?',
  //     cancelButtonLabel: 'Quay lại',
  //     confirmButtonLabel: 'Xoá',
  //   );
  //   if (confirm != null && confirm) {
  //     doDeleteClaim(claimId);
  //   }
  // }

  // void onCreateNewClaimTapped() async {
  //   // init
  //   licenseController.clear();
  //   claimNameController.clear();
  //   vehicleBrandName.value = null;
  //   vehicleBrandId.value = null;
  //   // show dialog
  //   var confirm = await Get.dialog<bool?>(const AddNewClaimDialogWidget());

  //   if (confirm != null && confirm) {
  //     doAddNewClaim();
  //   }
  // }

  // void onEditClaimTapped(Claim claim) async {
  //   // init
  //   claimNameController.text = claim.claimName;
  //   for (var element in vehicleBrandList) {
  //     if (element.vehicleBrandId == claim.vehicleBrandId.toString()) {
  //       vehicleBrandName.value = element.vehicleBrandName;
  //     }
  //   }
  //   // show dialog
  //   var confirm = await Get.dialog<bool?>(
  //       const AddNewClaimDialogWidget(isEditMode: true));

  //   if (confirm != null && confirm) {
  //     doEditClaim(claim);
  //   }
  // }

  // void doAddNewClaim() async {
  //   var result = await addNewClaim(
  //     claimName: claimNameController.text.trim(),
  //     licensePlate: licenseController.text,
  //     vehicleId: vehicleBrandId.value!,
  //   );

  //   processUsecaseResult(
  //     result: result,
  //     onSuccess: (value) {
  //       claimList.insert(0, value);
  //     },
  //     shouldShowFailure: (p0) => true,
  //   );
  // }

  // void doEditClaim(Claim claim) async {
  //   var result = await editClaim(
  //     claimId: claim.claimId,
  //     claimName: claimNameController.text,
  //     vehicleId: vehicleBrandId.value,
  //   );

  //   processUsecaseResult(
  //     result: result,
  //     onSuccess: (data) {
  //       int index =
  //           claimList.indexWhere((element) => element.claimId == claim.claimId);
  //       claimList[index] = data;
  //     },
  //   );
  // }
  // // end test engine mode

  // void switchMode() {
  //   if (appMode.value == AppMode.testEngine) {
  //     appMode.value = AppMode.collectData;
  //   } else {
  //     appMode.value = AppMode.testEngine;
  //   }
  //   applyMode();
  // }

  // void applyMode() {
  //   if (appMode.value == AppMode.collectData) {
  //     appModeToString.value = 'Collect Data';
  //     LocalStorageService().saveMode(AppMode.collectData);
  //   } else {
  //     appModeToString.value = 'Test Engine';
  //     LocalStorageService().saveMode(AppMode.testEngine);
  //   }
  // }

  // onRefesh() {
  //   if (pageIndex > 1) {
  //     pageIndex--;
  //     doFilterbyClass(filterValue.value, sortValue.value, searchValue.value);
  //   }
  //   folderRefreshCtrl.refreshCompleted();
  // }

  // void onLoadMore() {
  //   if (pageIndex < filterFolderRes[0].totalPage) {
  //     pageIndex++;
  //     doFilterbyClass(filterValue.value, sortValue.value, searchValue.value);
  //   }
  //   folderRefreshCtrl.loadComplete();
  // }

  // void filterFolder({required Map body, required int page}) async {
  //   filterLoading.value = true;
  //   var result = await doFilterFolder(body: body, page: page);
  //   await processUsecaseResult(
  //       result: result,
  //       refreshController: folderRefreshCtrl,
  //       isRefreshing: pageIndex == 1,
  //       onSuccess: (res) {
  //         filterFolderRes.assign(res);
  //         if (pageIndex > 1) {
  //           folderRes.addAll(res.data);
  //         } else {
  //           folderRes.assignAll(res.data);
  //         }
  //         filterLoading.value = false;
  //       },
  //       shouldShowFailure: (f) {
  //         filterLoading.value = false;
  //         return true;
  //       });
  //   // try {
  //   //   filterLoading.value = true;
  //   //   var result = await doFilterFolder(body: body, page: page);
  //   //   processUsecaseResult(
  //   //       result: result,
  //   //       onSuccess: (res) {
  //   //         filterFolderRes.assign(res);
  //   //         folderRes.assignAll(res.data);
  //   //       });
  //   //   filterLoading.value = false;
  //   // } catch (e) {
  //   //   filterLoading.value = false;
  //   //   logger.e(e);
  //   // }
  // }

  // void onCreateNewFolderTapped() async {
  //   // init
  //   createFolderController.clear();
  //   vehicleBrandName.value = null;
  //   // show dialog
  //   var confirm = await Get.dialog<bool?>(const AddNewFolderialogWidget());

  //   if (confirm != null && confirm) {
  //     doAddFolder();
  //   }
  // }

  // void onEditFolderTapped(FolderRes folderRes) async {
  //   // init
  //   vehicleBrandName.value = folderRes.vehicleBrand;
  //   createFolderController.text = folderRes.folderName;
  //   // show dialog
  //   var confirm = await Get.dialog<bool?>(
  //       const AddNewFolderialogWidget(isEditMode: true));

  //   if (confirm != null && confirm) {
  //     doEditFolder(folderRes);
  //   }
  // }

  // doAddFolder() async {
  //   var result = await addFolder(
  //     folderName: createFolderController.text.trim(),
  //     vehicleBrand: vehicleBrandName.value!,
  //   );
  //   processUsecaseResult(
  //     result: result,
  //     onSuccess: (res) {
  //       folderRes.insertAll(0, res.data);
  //     },
  //     shouldShowFailure: (f) => true,
  //   );
  // }

  // doEditFolder(FolderRes folder) async {
  //   var result = await editFolder(
  //     folderId: folder.folderId,
  //     folderName: createFolderController.text.trim(),
  //     vehicleBrand: vehicleBrandName.value!,
  //   );
  //   processUsecaseResult(
  //     result: result,
  //     onSuccess: (res) {
  //       int idx = folderRes
  //           .indexWhere(((element) => element.folderId == folder.folderId));
  //       if (idx != -1) {
  //         folderRes[idx] = folderRes[idx].copyWith(
  //           folderName: createFolderController.text.trim(),
  //           vehicleBrand: vehicleBrandName.value,
  //         );
  //       }
  //     },
  //     shouldShowFailure: (f) => true,
  //   );
  // }

  // doDeleteFolder({required String id}) async {
  //   bool? confirm = await ConfirmDialog.show(
  //     content: 'Bạn chắc chắn xoá hồ sơ?',
  //     cancelButtonLabel: 'Quay lại',
  //     confirmButtonLabel: 'Xoá',
  //   );
  //   if (confirm != null && confirm) {
  //     var result = await deleteFolder(id: id);
  //     processUsecaseResult(
  //       result: result,
  //       onSuccess: (res) {
  //         int idx = folderRes.indexWhere((element) => element.folderId == id);
  //         if (idx != -1) {
  //           folderRes.removeAt(idx);
  //         }
  //       },
  //       shouldShowFailure: (f) => true,
  //     );
  //   }
  // }

  // void doFilterbyClass(String filter, String sort, String searchVal) {
  //   var user = LocalStorageService().userInfo;
  //   var convert = sort == 'mới nhất' ? 'desc' : 'asc';
  //   switch (filter) {
  //     case 'Hồ sơ của tôi':
  //       filterFolder(body: {
  //         "searchBar": searchVal,
  //         "assessorIds": [user!.assessorId],
  //         "regions": [user.region],
  //         "dateOrder": convert
  //       }, page: pageIndex);
  //       break;
  //     case 'Tất cả hồ sơ cùng khu vực':
  //       filterFolder(body: {
  //         "searchBar": searchVal,
  //         "regions": [user!.region],
  //         "dateOrder": convert
  //       }, page: pageIndex);
  //       break;
  //     case 'Tất cả hồ sơ':
  //       filterFolder(
  //           body: {"searchBar": searchVal, "dateOrder": convert},
  //           page: pageIndex);
  //       break;
  //     default:
  //   }
  // }
}
