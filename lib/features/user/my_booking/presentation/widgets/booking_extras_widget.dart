import 'dart:async';

import 'package:add_2_calendar/add_2_calendar.dart' as a2c;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:true_balance_app/core/themes/app_colors.dart';
import 'package:true_balance_app/features/user/my_booking/data/models/Consultations/consultations_response.dart';
import 'package:url_launcher/url_launcher.dart';

/// Confirmed-booking extras: live countdown to appointment, online vs clinic
/// info card, add-to-calendar (Apple/Google/native), share and directions.
///
/// Mirrors the web `BookingProfileDetails` enhancements 1:1 so users see the
/// same UX after payment regardless of platform.
class BookingExtrasWidget extends StatefulWidget {
  const BookingExtrasWidget({super.key, required this.consultation});

  final Consultation consultation;

  @override
  State<BookingExtrasWidget> createState() => _BookingExtrasWidgetState();
}

class _BookingExtrasWidgetState extends State<BookingExtrasWidget> {
  Timer? _ticker;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    // 60s granularity; the UI displays days/hours/minutes so finer ticks
    // would just churn re-renders.
    _ticker = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  DateTime? _appointmentStart() {
    try {
      final t = widget.consultation.time.length == 5
          ? '${widget.consultation.time}:00'
          : widget.consultation.time;
      return DateTime.parse('${widget.consultation.date}T$t');
    } catch (_) {
      return null;
    }
  }

  String _doctorName() => widget.consultation.doctor.name;

  bool _isOnline() => widget.consultation.consultationType == 'online';

  String _eventTitle() =>
      'consultationWithDr'.tr(namedArgs: {'name': _doctorName()});

  String _eventDescription() {
    if (_isOnline()) {
      return 'onlineConsultationDescription'.tr();
    }
    final clinic = widget.consultation.clinicName ?? '';
    return 'inPersonConsultationAt'.tr(namedArgs: {'clinic': clinic});
  }

  String? _eventLocation() {
    if (_isOnline()) return 'Online';
    return widget.consultation.clinicAddress ??
        widget.consultation.clinicName;
  }

  Future<void> _addToCalendar() async {
    final start = _appointmentStart();
    if (start == null) return;
    final end = start.add(const Duration(hours: 1));
    final event = a2c.Event(
      title: _eventTitle(),
      description: _eventDescription(),
      location: _eventLocation() ?? '',
      startDate: start,
      endDate: end,
    );
    await a2c.Add2Calendar.addEvent2Cal(event);
  }

  Future<void> _openDirections(String address) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _shareBooking() async {
    final start = _appointmentStart();
    final when = start == null
        ? ''
        : DateFormat.yMMMMEEEEd(context.locale.languageCode)
            .add_jm()
            .format(start);
    final text = '${_eventTitle()}\n$when';
    await Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    final start = _appointmentStart();
    final isPast = start != null && start.isBefore(_now);
    final remaining = start == null ? Duration.zero : start.difference(_now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Confirmation header + countdown
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF22C55E), Color(0xFF059669)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withValues(alpha: 0.25),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'bookingConfirmed'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        if (start != null)
                          Text(
                            DateFormat.yMMMMEEEEd(context.locale.languageCode)
                                .add_jm()
                                .format(start),
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.95),
                              fontSize: 12.sp,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (!isPast && start != null) ...[
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _CountdownSegment(
                        value: remaining.inDays,
                        label: 'days'.tr(),
                      ),
                      _CountdownSegment(
                        value: remaining.inHours.remainder(24),
                        label: 'hours'.tr(),
                      ),
                      _CountdownSegment(
                        value: remaining.inMinutes.remainder(60),
                        label: 'minutes'.tr(),
                      ),
                    ],
                  ),
                ),
              ],
              if (isPast) ...[
                SizedBox(height: 12.h),
                Text(
                  'appointmentPassed'.tr(),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.95),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: 12.h),

        // Online vs clinic info
        if (_isOnline())
          _InfoCard(
            color: const Color(0xFF3B82F6),
            background: const Color(0xFFEFF6FF),
            border: const Color(0xFFBFDBFE),
            icon: Icons.videocam_outlined,
            title: 'onlineConsultation'.tr(),
            body: 'onlineConsultationDescription'.tr(),
          )
        else if (widget.consultation.clinicName != null)
          _ClinicCard(
            name: widget.consultation.clinicName!,
            address: widget.consultation.clinicAddress,
            onDirections: widget.consultation.clinicAddress == null
                ? null
                : () => _openDirections(widget.consultation.clinicAddress!),
          ),
        SizedBox(height: 12.h),

        // Booking summary
        _BookingSummary(consultation: widget.consultation),
        SizedBox(height: 12.h),

        // Action grid: Calendar / Share
        Row(
          children: [
            Expanded(
              child: _ActionButton(
                icon: Icons.calendar_today_outlined,
                label: 'addToCalendar'.tr(),
                onTap: _addToCalendar,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _ActionButton(
                icon: Icons.share_outlined,
                label: 'share'.tr(),
                onTap: _shareBooking,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CountdownSegment extends StatelessWidget {
  const _CountdownSegment({required this.value, required this.label});
  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString().padLeft(2, '0'),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 10.sp,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.color,
    required this.background,
    required this.border,
    required this.icon,
    required this.title,
    required this.body,
  });
  final Color color;
  final Color background;
  final Color border;
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.r)),
            child: Icon(icon, color: Colors.white, size: 18.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: AppColors.neutralColor100,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(body, style: TextStyle(fontSize: 12.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClinicCard extends StatelessWidget {
  const _ClinicCard({
    required this.name,
    required this.address,
    required this.onDirections,
  });
  final String name;
  final String? address;
  final VoidCallback? onDirections;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        border: Border.all(color: const Color(0xFFFDE68A)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.location_on, color: Colors.white, size: 18.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
                if (address != null) ...[
                  SizedBox(height: 2.h),
                  Text(address!, style: TextStyle(fontSize: 12.sp)),
                ],
                if (onDirections != null) ...[
                  SizedBox(height: 8.h),
                  InkWell(
                    onTap: onDirections,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.directions, size: 16.sp, color: const Color(0xFFB45309)),
                        SizedBox(width: 4.w),
                        Text(
                          'getDirections'.tr(),
                          style: TextStyle(
                            color: const Color(0xFFB45309),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingSummary extends StatelessWidget {
  const _BookingSummary({required this.consultation});
  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _row(
            'bookingRef'.tr(),
            '#${consultation.id}',
            mono: true,
          ),
          if (consultation.payment?.amount != null)
            _row(
              'amountPaid'.tr(),
              '${consultation.payment?.currency ?? "SAR"} ${consultation.payment?.amount?.toStringAsFixed(2) ?? "0.00"}',
            ),
          if (consultation.payment?.transactionId != null)
            _row(
              'transactionRef'.tr(),
              '#${consultation.payment?.transactionId}',
              mono: true,
            ),
          if (consultation.payment?.paidAt != null)
            _row('paidOn'.tr(), consultation.payment!.paidAt!),
        ],
      ),
    );
  }

  Widget _row(String k, String v, {bool mono = false}) => Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(k, style: TextStyle(color: Colors.grey.shade600, fontSize: 12.sp)),
            Text(
              v,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                fontFamily: mono ? 'monospace' : null,
                color: AppColors.neutralColor100,
              ),
            ),
          ],
        ),
      );
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16.sp, color: AppColors.neutralColor100),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.neutralColor100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
