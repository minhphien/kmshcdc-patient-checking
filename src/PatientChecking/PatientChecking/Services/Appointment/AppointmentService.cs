﻿using Microsoft.EntityFrameworkCore;
using PatientCheckIn.DataAccess.Models;
using PatientChecking.ServiceModels;
using PatientChecking.ServiceModels.Enum;
using PatientChecking.Views.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PatientChecking.Services.Appointment
{
    public class AppointmentService : IAppointmentService
    {
        private readonly PatientCheckInContext _patientCheckInContext;

        public AppointmentService(PatientCheckInContext patientCheckInContext)
        {
            _patientCheckInContext = patientCheckInContext;
        }

        public async Task<PatientCheckIn.DataAccess.Models.Appointment> GetAppointmentByIdAsync(int appointmentId)
        {
            return await _patientCheckInContext.Appointments.FirstOrDefaultAsync(x => x.AppointmentId == appointmentId);
        }

        public async Task<AppointmentDashboard> GetAppointmentSummaryAsync()
        {
            var numberOfAppointments = await _patientCheckInContext.Appointments.ToListAsync();
            var numberOfAppointmentsInMonth = await _patientCheckInContext.Appointments.Where(x => x.CheckInDate.Date.Year == DateTime.Now.Year && x.CheckInDate.Date.Month == DateTime.Now.Month).ToListAsync();
            var numberOfAppointmentsInToday = await _patientCheckInContext.Appointments.Where(x => x.CheckInDate.Date == DateTime.Today && x.Status == AppointmentStatus.CheckIn.ToString()).ToListAsync();
            var numberOfPatientsInMonth = await _patientCheckInContext.Appointments.Where(x => x.CheckInDate.Year == DateTime.Now.Year && x.CheckInDate.Month == DateTime.Now.Month)
                                                                 .GroupBy(p => p.PatientId)
                                                                 .Select(g => new { g.Key, count = g.Count() }).ToListAsync();
            return new AppointmentDashboard
            {
                NumOfAppointments = numberOfAppointments.Count(),
                NumOfAppointmentsInMonth = numberOfAppointmentsInMonth.Count(),
                NumOfAppointmentsInToday = numberOfAppointmentsInToday.Count(),
                NumOfPatientsInMonth = numberOfPatientsInMonth.Count()
            };
        }

        public async Task<AppointmentList> GetListAppoinmentsPagingAsync(PagingRequest request)
        {
            var query = from appointment in _patientCheckInContext.Appointments
                        join patient in _patientCheckInContext.Patients on appointment.Patient.PatientId equals patient.PatientId
                        select new { appointment, patient };
            if (request.SortSelection == (int)AppointmentSortSelection.Name)
            {
                query = query.OrderBy(i => i.patient.FullName);
            }
            else if (request.SortSelection == (int)AppointmentSortSelection.ID)
            {
                query = query.OrderBy(i => i.patient.PatientIdentifier);
            }
            else if (request.SortSelection == (int)AppointmentSortSelection.DoB)
            {
                query = query.OrderBy(i => i.patient.DoB);
            }
            else if (request.SortSelection == (int)AppointmentSortSelection.CheckInDate)
            {
                query = query.OrderByDescending(i => i.appointment.CheckInDate);
            }
            else
            {
                query = query.OrderBy(i => i.appointment.Status == AppointmentStatus.CheckIn.ToString() ? 1
                                         : i.appointment.Status == AppointmentStatus.Closed.ToString() ? 2
                                         : 3
                );
            }
            int totalRow = query.Count();
            var data = query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize).Select(x => new ServiceModels.Appointment
                {
                    AppointmentId = x.appointment.AppointmentId,
                    CheckInDate = x.appointment.CheckInDate,
                    Status = x.appointment.Status,
                    Patient = new ServiceModels.Patient
                    {
                        AvatarLink = x.patient.AvatarLink,
                        DoB = x.patient.DoB,
                        FullName = x.patient.FullName,
                        PatientIdentifier = x.patient.PatientIdentifier
                    }
                }).ToList();
            AppointmentList appointmentList = new AppointmentList
            {
                TotalCount = totalRow,
                Appointments = data
            };
            return appointmentList;
        }

        public async Task<int> UpdateAppointmentAsync(PatientCheckIn.DataAccess.Models.Appointment appointment)
        {
            if(appointment == null)
            {
                return -1;
            }
            _patientCheckInContext.Appointments.Update(appointment);
            return await _patientCheckInContext.SaveChangesAsync();
        }
    }
}
