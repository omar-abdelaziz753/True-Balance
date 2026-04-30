import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/widgets/saudi_riyal_icon.dart';
import 'package:true_balance_app/features/user/create%20booking/bloc/cubit/create_booking_cubit.dart';
import 'package:true_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';

class BookingSummaryCard extends StatelessWidget {
  final DoctorModelDetails doctor;

  const BookingSummaryCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateBookingCubit>();
    final selectedDate = cubit.data;
    final selectedTimeIndex = cubit.selectedTimeIndex;
    final time = cubit.freeSlotsModel?.data[selectedTimeIndex] ?? '';
    final locale = context.locale.toString();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDoctorSummary(),
          16.verticalSpace,
          _buildAppointmentDetails(selectedDate, time, locale),
          16.verticalSpace,
          _buildClinicInfo(),
          16.verticalSpace,
          _buildNotesField(context),
          16.verticalSpace,
          _buildPriceBreakdown(),
        ],
      ),
    );
  }

  Widget _buildDoctorSummary() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: doctor.image ?? '',
              width: 60.w,
              height: 60.w,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 60.w,
                height: 60.w,
                color: AppColors.neutralColor200,
                child: Icon(Icons.person,
                    size: 30.sp, color: AppColors.neutralColor400),
              ),
              errorWidget: (_, __, ___) => Container(
                width: 60.w,
                height: 60.w,
                color: AppColors.neutralColor200,
                child: Icon(Icons.person,
                    size: 30.sp, color: AppColors.neutralColor400),
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name ?? 'Doctor',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutralColor900)),
                4.verticalSpace,
                Text(doctor.specialization ?? 'Specialization',
                    style: TextStyle(
                        fontSize: 13.sp, color: AppColors.neutralColor500)),
                4.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.star, size: 14.sp, color: Colors.amber.shade700),
                    4.horizontalSpace,
                    Text('${doctor.rate ?? 0}.0',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.amber.shade700)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentDetails(DateTime date, String time, String locale) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('appointmentDetails'.tr(),
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutralColor900)),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                  child: _buildDetailItem(Icons.calendar_today, 'date'.tr(),
                      DateFormat('EEEE, MMMM d, y', locale).format(date))),
              Expanded(
                  child:
                      _buildDetailItem(Icons.access_time, 'time'.tr(), time)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClinicInfo() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor10.withAlpha(26),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryColor10.withAlpha(51)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on,
                  size: 18.sp, color: AppColors.primaryColor900),
              8.horizontalSpace,
              Text('clinicLocation'.tr(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor900)),
            ],
          ),
          12.verticalSpace,
          Text('True Balance - الشرفات بارك',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.neutralColor800)),
          4.verticalSpace,
          Text('الخبر - الشرفات بارك، المملكة العربية السعودية',
              style:
                  TextStyle(fontSize: 12.sp, color: AppColors.neutralColor600)),
          12.verticalSpace,
          Row(
            children: [
              _buildClinicChip(Icons.phone, '0558509595'),
              8.horizontalSpace,
              _buildClinicChip(Icons.access_time, '9ص - 9م'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClinicChip(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.sp, color: AppColors.primaryColor900),
          4.horizontalSpace,
          Text(text,
              style:
                  TextStyle(fontSize: 11.sp, color: AppColors.neutralColor700)),
        ],
      ),
    );
  }

  Widget _buildNotesField(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.note_alt_outlined,
                  size: 18.sp, color: AppColors.primaryColor900),
              8.horizontalSpace,
              Text('notesForDoctor'.tr(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.neutralColor900)),
              Text(' (${'optional'.tr()})',
                  style: TextStyle(
                      fontSize: 12.sp, color: AppColors.neutralColor400)),
            ],
          ),
          12.verticalSpace,
          TextField(
            maxLines: 3,
            maxLength: 500,
            decoration: InputDecoration(
              hintText: 'notesHint'.tr(),
              hintStyle:
                  TextStyle(fontSize: 13.sp, color: AppColors.neutralColor400),
              filled: true,
              fillColor: AppColors.neutralColor100,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none),
              contentPadding: EdgeInsets.all(12.w),
            ),
            style: TextStyle(fontSize: 13.sp, color: AppColors.neutralColor800),
            onChanged: (value) =>
                context.read<CreateBookingCubit>().setNotes(value),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceBreakdown() {
    final price = doctor.consultationPrice ?? 150.0;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('paymentSummary'.tr(),
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutralColor900)),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('consultationFee'.tr(),
                  style: TextStyle(
                      fontSize: 13.sp, color: AppColors.neutralColor600)),
              Row(
                children: [
                  RiyalAmount(
                      amount: price.toStringAsFixed(2),
                      fontSize: 13,
                      color: AppColors.neutralColor800),
                ],
              ),
            ],
          ),
          12.verticalSpace,
          Divider(color: AppColors.neutralColor200),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('total'.tr(),
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutralColor900)),
              RiyalAmount(
                  amount: price.toStringAsFixed(2),
                  fontSize: 18,
                  color: AppColors.primaryColor900,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
              color: AppColors.neutralColor100,
              borderRadius: BorderRadius.circular(8.r)),
          child: Icon(icon, size: 16.sp, color: AppColors.primaryColor900),
        ),
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                      fontSize: 11.sp, color: AppColors.neutralColor400)),
              Text(value,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.neutralColor800),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ],
    );
  }
}
