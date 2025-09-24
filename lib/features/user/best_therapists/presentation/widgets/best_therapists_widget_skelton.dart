import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/features/user/best_therapists/presentation/widgets/therapist_card_widget.dart';
import 'package:truee_balance_app/features/user/home/data/model/doctors/all_doctors_data_model.dart';

class BestTherapistsWidgetSkelton extends StatelessWidget {
  const BestTherapistsWidgetSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return TherapistCardWidget(
                      doctorModel: DoctorModel(
                    email: 'email',
                    name: 'name',
                    phone: 'phone',
                    image: 'image',
                    about: "fdfdfd",
                    id: 1,
                    age: 0,
                    gender: "male",
                    specialization: 'specialization',
                    type: 'type',
                    rate: 0.0,
                    rateCount: 0,
                  ));
                },
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemCount: 9,
              ),
            )
          ],
        ),
      ),
    );
  }
}
