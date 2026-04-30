import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/core/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:true_balance_app/core/widgets/saudi_riyal_icon.dart';
import 'package:true_balance_app/features/payment/presentation/screens/payment_screen.dart';
import 'package:true_balance_app/features/user/my_booking/bloc/mybook_cubit.dart';
import 'package:true_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';
import 'package:true_balance_app/features/user/my_booking/presentation/widgets/show_rating_bottom_sheet_for_user_consultaion.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.consultation});

  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    final isPending = consultation.status == "pending";
    final doctor = consultation.doctor;

    return Scaffold(
      backgroundColor: AppColors.primaryColor10,
      appBar: CustomBasicAppBar(
        leading: BackButton(
          color: AppColors.neutralColor100,
          onPressed: () => Navigator.pop(context),
        ),
        title: 'bookingDetails'.tr(),
        backgroundColor: AppColors.primaryColor10,
        svgAsset: 'assets/images/svg/bg_image.svg',
      ),
      body: BlocListener<MybookCubit, MybookState>(
        listener: (context, state) {
          if (state is InitiatePaymentSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PaymentScreen(
                  bookingId: state.consultationId,
                  amount: state.amount,
                  currency: 'SAR',
                  isForConsultation: true,
                  onPaymentSuccess: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  },
                  onPaymentFailed: () {},
                  onPaymentCancelled: () {},
                ),
              ),
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.neutralColor100,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 120.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDoctorCard(doctor),
                    16.verticalSpace,
                    _buildAppointmentCard(),
                    16.verticalSpace,
                    if (consultation.payment != null) ...[
                      _buildPaymentCard(),
                      16.verticalSpace,
                    ],
                    if (consultation.doctorEvaluation != null &&
                        consultation.doctorEvaluation!.isNotEmpty) ...[
                      _buildDoctorNotesCard(),
                      16.verticalSpace,
                    ],
                    if (consultation.userMessage != null &&
                        consultation.userMessage!.isNotEmpty) ...[
                      _buildUserNotesCard(),
                      16.verticalSpace,
                    ],
                    _buildInfoCard(),
                    16.verticalSpace,
                    if (!isPending) _buildRatingButton(context),
                  ],
                ),
              ),
              if (isPending) _buildPayButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: doctor.image.isNotEmpty ? doctor.image : '',
                  width: 80.w,
                  height: 80.w,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                      width: 80.w,
                      height: 80.w,
                      color: AppColors.neutralColor200,
                      child: Icon(Icons.person,
                          size: 40.sp, color: AppColors.neutralColor400)),
                  errorWidget: (_, __, ___) => Container(
                      width: 80.w,
                      height: 80.w,
                      color: AppColors.neutralColor200,
                      child: Icon(Icons.person,
                          size: 40.sp, color: AppColors.neutralColor400)),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor.name.isNotEmpty ? doctor.name : 'Doctor Name',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.neutralColor900)),
                    4.verticalSpace,
                    Text(
                        doctor.specialization.isNotEmpty
                            ? doctor.specialization
                            : 'Specialization',
                        style: TextStyle(
                            fontSize: 14.sp, color: AppColors.neutralColor500)),
                    8.verticalSpace,
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              color: Colors.amber.withAlpha(26),
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star,
                                  size: 14.sp, color: Colors.amber.shade700),
                              4.horizontalSpace,
                              Text('${doctor.rate}.0',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.amber.shade700)),
                            ],
                          ),
                        ),
                        8.horizontalSpace,
                        Text('(${doctor.rateCount} ${'reviews'.tr()})',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.neutralColor400)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (doctor.about != null && doctor.about!.isNotEmpty) ...[
            12.verticalSpace,
            Text(doctor.about!,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.neutralColor500,
                    height: 1.4)),
          ],
        ],
      ),
    );
  }

  Widget _buildAppointmentCard() {
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
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('appointmentDetails'.tr(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutralColor900)),
            _buildStatusBadge(),
          ]),
          16.verticalSpace,
          _buildDetailRow(Icons.calendar_today_outlined, 'date'.tr(),
              Text(consultation.date)),
          12.verticalSpace,
          _buildDetailRow(
              Icons.access_time, 'time'.tr(), Text(consultation.time)),
          12.verticalSpace,
          _buildDetailRow(
              consultation.consultationType == 'online'
                  ? Icons.videocam
                  : Icons.location_on,
              'consultationType'.tr(),
              Text(consultation.consultationType == 'online'
                  ? 'online'.tr()
                  : 'offline'.tr())),
          12.verticalSpace,
          _buildDetailRow(Icons.local_hospital, 'clinic'.tr(),
              Text(consultation.clinicName ?? 'True Balance - الشرفات بارك')),
          12.verticalSpace,
          _buildDetailRow(
              Icons.location_on,
              'address'.tr(),
              Text(consultation.clinicAddress ??
                  'الخبر - الشرفات بارك، المملكة العربية السعودية')),
          if (consultation.clinicPhone != null) ...[
            12.verticalSpace,
            _buildDetailRow(Icons.phone, 'phone'.tr(),
                Text(consultation.clinicPhone ?? '')),
          ],
          if (consultation.clinicWorkingHours != null) ...[
            12.verticalSpace,
            _buildDetailRow(Icons.access_time, 'workingHours'.tr(),
                Text(consultation.clinicWorkingHours!)),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color bgColor;
    Color textColor;
    String text;
    switch (consultation.status) {
      case 'pending':
        bgColor = Colors.orange.withAlpha(26);
        textColor = Colors.orange.shade700;
        text = 'pending'.tr();
        break;
      case 'confirmed':
        bgColor = AppColors.primaryColor10.withAlpha(26);
        textColor = AppColors.primaryColor10;
        text = 'confirmed'.tr();
        break;
      case 'completed':
        bgColor = Colors.green.withAlpha(26);
        textColor = Colors.green.shade700;
        text = 'completed'.tr();
        break;
      default:
        bgColor = AppColors.neutralColor200;
        textColor = AppColors.neutralColor600;
        text = consultation.status;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20.r)),
      child: Text(text,
          style: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.w600, color: textColor)),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, Widget value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
                color: AppColors.neutralColor100,
                borderRadius: BorderRadius.circular(8.r)),
            child: Icon(icon, size: 18.sp, color: AppColors.neutralColor500)),
        12.horizontalSpace,
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label,
              style:
                  TextStyle(fontSize: 12.sp, color: AppColors.neutralColor400)),
          2.verticalSpace,
          DefaultTextStyle(
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutralColor900),
              child: value)
        ])),
      ],
    );
  }

  Widget _buildPaymentCard() {
    final payment = consultation.payment;
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
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('paymentDetails'.tr(),
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutralColor900)),
          16.verticalSpace,
          _buildDetailRow(
              Icons.attach_money,
              'amount'.tr(),
              RiyalAmount(
                  amount: payment?.amount?.toStringAsFixed(2) ?? '0',
                  fontSize: 14,
                  color: AppColors.neutralColor900)),
          12.verticalSpace,
          _buildDetailRow(
              Icons.credit_card,
              'paymentMethod'.tr(),
              Text(_getPaymentMethodText(payment?.paymentMethod),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.neutralColor900))),
          if (payment?.geideaOrderId != null) ...[
            12.verticalSpace,
            _buildDetailRow(
                Icons.receipt_long,
                'transactionId'.tr(),
                Text(
                    payment!.geideaOrderId!.length > 20
                        ? '${payment.geideaOrderId!.substring(0, 20)}...'
                        : payment.geideaOrderId!,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutralColor900)))
          ],
          if (payment?.paidAt != null) ...[
            12.verticalSpace,
            _buildDetailRow(
                Icons.check_circle,
                'paidAt'.tr(),
                Text(_formatDateTime(payment!.paidAt!),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutralColor900)))
          ],
        ],
      ),
    );
  }

  String _getPaymentMethodText(String? method) {
    switch (method) {
      case 'card':
        return 'creditCard'.tr();
      case 'apple_pay':
        return 'applePay'.tr();
      case 'google_pay':
        return 'googlePay'.tr();
      case 'mada':
        return 'madaCard'.tr();
      default:
        return method ?? 'creditCard'.tr();
    }
  }

  String _formatDateTime(String dateTimeStr) {
    try {
      final dt = DateTime.parse(dateTimeStr);
      return '${dt.day}/${dt.month}/${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateTimeStr;
    }
  }

  Widget _buildDoctorNotesCard() {
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
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('doctorNotes'.tr(),
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.neutralColor900)),
        12.verticalSpace,
        Text(consultation.doctorEvaluation!,
            style: TextStyle(
                fontSize: 14.sp, color: AppColors.neutralColor600, height: 1.5))
      ]),
    );
  }

  Widget _buildUserNotesCard() {
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
              Text('yourNotes'.tr(),
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutralColor900)),
            ],
          ),
          12.verticalSpace,
          Text(consultation.userMessage!,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.neutralColor600,
                  height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
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
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('bookingInformation'.tr(),
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.neutralColor900)),
        16.verticalSpace,
        _buildDetailRow(
            Icons.calendar_month,
            'bookingDate'.tr(),
            Text(_formatDateTime(consultation.createdAt ?? ''),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutralColor900))),
        12.verticalSpace,
        _buildDetailRow(
            Icons.tag,
            'consultationId'.tr(),
            Text('#${consultation.id}',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutralColor900))),
      ]),
    );
  }

  Widget _buildRatingButton(BuildContext context) {
    return BlocBuilder<MybookCubit, MybookState>(
      builder: (context, state) {
        final cubit = context.watch<MybookCubit>();
        if (consultation.rating == null && !cubit.hasRated) {
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                final result = await showRatingBottomSheetForUserConsultaion(
                    context, consultation.id);
                if (result) cubit.updateHasRated(true);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor10,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r))),
              icon: Icon(Icons.star_outline, size: 20.sp),
              label: Text('rateYourExperience'.tr(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            ),
          );
        }
        if (consultation.rating != null) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                color: AppColors.primaryColor10.withAlpha(26),
                borderRadius: BorderRadius.circular(12.r),
                border:
                    Border.all(color: AppColors.primaryColor10.withAlpha(51))),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.check_circle,
                  color: AppColors.primaryColor10, size: 20.sp),
              8.horizontalSpace,
              Text('thankYouForRating'.tr(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor10))
            ]),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              offset: const Offset(0, -2))
        ]),
        child: SafeArea(
          top: false,
          child: BlocBuilder<MybookCubit, MybookState>(
            builder: (context, state) {
              final isLoading = state is InitiatePaymentLoading;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () => context
                          .read<MybookCubit>()
                          .initiatePayment(consultationId: consultation.id),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor10,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r))),
                  child: isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.white)))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Icon(Icons.payment, size: 20.sp),
                              8.horizontalSpace,
                              Text('${'payNow'.tr()} ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600)),
                              RiyalAmount(
                                  amount:
                                      consultation.price?.toStringAsFixed(0) ??
                                          '150',
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)
                            ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
