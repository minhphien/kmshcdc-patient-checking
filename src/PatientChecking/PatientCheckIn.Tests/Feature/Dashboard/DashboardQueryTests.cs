﻿using Moq;
using PatientChecking.Feature.Dashboard.Queries;
using PatientChecking.ServiceModels;
using PatientChecking.Services.Appointment;
using PatientChecking.Services.Patient;
using PatientChecking.Views.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace PatientCheckIn.Tests.Feature.Dashboard
{
    public class DashboardQueryTests
    {

        private AppointmentDashboard AppointmentDashboardData()
        {
            var data = new AppointmentDashboard
            {
                NumOfAppointments = 6,
                NumOfAppointmentsInMonth = 5,
                NumOfAppointmentsInToday = 1,
                NumOfPatientsInMonth = 5,
            };
            return data;
        }
        [Fact]
        public async Task GetDashBoardDataQuery()
        {
            //Arange
            var data = AppointmentDashboardData();
            var appointmentServices = new Mock<IAppointmentService>();
            var patientServices = new Mock<IPatientService>();
            appointmentServices.Setup(x => x.GetAppointmentSummaryAsync()).ReturnsAsync(data);
            patientServices.Setup(x => x.GetPatientsSummaryAsync()).ReturnsAsync(5);
            var request = new GetDashBoardDataQuery();
            var handler = new GetDashBoardDataHandler(appointmentServices.Object, patientServices.Object);
            var cts = new CancellationToken();

            var expected = new DashboardViewModel
            {
                NumOfAppointments = data.NumOfAppointments,
                NumOfAppointmentsInMonth = data.NumOfAppointmentsInMonth,
                NumOfAppointmentsInToday = data.NumOfAppointmentsInToday,
                NumOfPatients = 5,
                NumOfPatientsInMonth = data.NumOfPatientsInMonth,
            };

            //Act
            var actual = await handler.Handle(request, cts);

            //Assert
            Assert.Equal(expected.NumOfAppointments, actual.NumOfAppointments);
            Assert.Equal(expected.NumOfAppointmentsInMonth, actual.NumOfAppointmentsInMonth);
            Assert.Equal(expected.NumOfAppointmentsInToday, actual.NumOfAppointmentsInToday);
            Assert.Equal(expected.NumOfPatients, actual.NumOfPatients);
            Assert.Equal(expected.NumOfPatientsInMonth, actual.NumOfPatientsInMonth);
        }
    }
}
