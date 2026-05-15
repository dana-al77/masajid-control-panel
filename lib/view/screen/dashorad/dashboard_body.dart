import 'package:ecommaerce_course/controller/dashboard/dashboard.dart';
import 'package:ecommaerce_course/core/class/handling_data_view.dart';
import 'package:ecommaerce_course/core/constant/color.dart';
import 'package:ecommaerce_course/data/model/mosque_model.dart';
import 'package:ecommaerce_course/view/widget/statcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboradControllerImp>(builder: (controller) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'البحث:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 900,
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DropdownButton<String>(
                      value: controller.searchType,
                      dropdownColor: AppColor.Begie,
                      style: const TextStyle(
                        // color: AppColor.bluish,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(
                          value: 'name',
                          child: Text(
                            "🔤 الاسم",
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'category',
                          child: Text(
                            "🏷️ الفئة",
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          controller.setSearchTypeAndSearch(value);
                        }
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  // حقل البحث
                  Expanded(
                    child: TextFormField(
                      controller: controller.search,
                      decoration: InputDecoration(
                        hintText: 'ابحث باسم المسجد أو المدينة...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: controller.search!.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  controller.clearSearch();
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: Colors.brown, width: 2.0),
                        ),
                      ),
                      onChanged: (val) => controller.checkSearch(val),
                      onFieldSubmitted: (_) => controller.searchData(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // عرض المحتوى حسب حالة البحث
            handlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        const Text(
                          'الإحصائيات السريعة:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            StatCard(title: 'عدد المساجد', count: '124'),
                            StatCard(
                                title: 'عدد المشرفين الفعالين', count: '45'),
                            StatCard(title: 'عدد القائمين', count: '212'),
                            StatCard(title: 'الشكاوى النشطة', count: '8'),
                            StatCard(title: 'الأنشطة الجارية', count: '12'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'روابط سريعة:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: [
                            ElevatedButton.icon(
                              onPressed: controller.GoToaddMosque,
                              icon: Icon(Icons.add, color: AppColor.Begie),
                              label: Text(
                                'إضافة مسجد',
                                style: TextStyle(color: AppColor.Begie),
                              ),
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(20, 50)), // ← العرض, الارتفاع

                                backgroundColor:
                                    MaterialStateProperty.all(AppColor.bluish),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: controller.GoToAddManger,
                              icon:
                                  Icon(Icons.person_add, color: AppColor.Begie),
                              label: Text(
                                'إضافة مشرف',
                                style: TextStyle(color: AppColor.Begie),
                              ),
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(20, 50)), // ← العرض, الارتفاع

                                backgroundColor:
                                    MaterialStateProperty.all(AppColor.bluish),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: controller.goToIssueDecision,
                              icon:
                                  Icon(Icons.file_copy, color: AppColor.Begie),
                              label: Text(
                                'إصدار قرار جديد',
                                style: TextStyle(color: AppColor.Begie),
                              ),
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(20, 50)), // ← العرض, الارتفاع

                                backgroundColor:
                                    MaterialStateProperty.all(AppColor.bluish),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.report, color: AppColor.Begie),
                              label: Text(
                                'عرض تقارير الصيانة',
                                style: TextStyle(color: AppColor.Begie),
                              ),
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(20, 50)), // ← العرض, الارتفاع

                                backgroundColor:
                                    MaterialStateProperty.all(AppColor.bluish),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                controller.goToRequest();
                              },
                              icon: Icon(Icons.campaign, color: AppColor.Begie),
                              label: Text(
                                ' ادارة الشكاوي',
                                style: TextStyle(color: AppColor.Begie),
                              ),
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(20, 50)), // ← العرض, الارتفاع

                                backgroundColor:
                                    MaterialStateProperty.all(AppColor.bluish),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : ListItemsSearch(listdatamodel: controller.listdata),
            ),
          ],
        ),
      );
    });
  }
}

class ListItemsSearch extends StatelessWidget {
  final List<MosqueModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Image.network(
              listdatamodel[index].image_path ?? '',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported),
            ),
            title: Text(listdatamodel[index].name ?? ''),
            subtitle: Text(listdatamodel[index].details ?? ''),
            onTap: () {
              // TODO: Navigate to mosque details
            },
          ),
        );
      },
    );
  }
}
