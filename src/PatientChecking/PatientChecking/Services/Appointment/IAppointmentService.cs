﻿using PatientChecking.ServiceModels;
using PatientChecking.Views.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PatientChecking.Services.Appointment
{
    public interface IAppointmentService
    {
        Task<AppointmentDashboard> GetAppointmentSummary();
        Task<AppointmentList> GetListAppoinmentsPaging(PagingRequest request);
        Task <int> UpdateAppointment(PatientCheckIn.DataAccess.Models.Appointment appointment);
        Task<PatientCheckIn.DataAccess.Models.Appointment> GetAppointmentById(int appointmentId);
    }
}