﻿using Microsoft.EntityFrameworkCore;
using PatientCheckIn.DataAccess.Models;
using PatientChecking.Services.Repository;
using PatientChecking.Services.ServiceModels;
using PatientChecking.Services.ServiceModels.Enum;
using PatientChecking.Views.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PatientChecking.Services
{
    public class PatientService : IPatientService
    {
        private readonly PatientCheckInContext _patientCheckInContext;

        public PatientService(PatientCheckInContext patientCheckInContext)
        {
            _patientCheckInContext = patientCheckInContext;
        }

        public PatientList GetListPatientPaging(PagingRequest request)
        {
            var query = from patient in _patientCheckInContext.Patients
                        join contact in _patientCheckInContext.Contacts on patient.PatientId equals contact.PatientId into pc
                        from patientContact in pc.DefaultIfEmpty()

                        join address in _patientCheckInContext.Addresses on patientContact.ContactId equals address.ContactId into pa
                        from patientAddress in pa.DefaultIfEmpty()
                        where patientAddress == null || patientAddress.IsPrimary == true

                        select new { patient, patientContact, patientAddress };

            if (request.SortSelection == (int)PatientSortSelection.ID)
            {
                query = query.OrderBy(i => i.patient.PatientIdentifier);
            }
            else if (request.SortSelection == (int)PatientSortSelection.Name)
            {
                query = query.OrderBy(i => i.patient.FullName);
            }
            else
            {
                query = query.OrderBy(i => i.patient.DoB);
            }

            var totalRow = query.Count();

            var data = query
                .Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize).Select(x => new ServiceModels.Patient()
                {
                    PatientId = x.patient.PatientId,
                    PatientIdentifier = x.patient.PatientIdentifier,
                    FullName = x.patient.FullName,
                    DoB = x.patient.DoB,
                    Gender = (PatientGender) x.patient.Gender,
                    AvatarLink = x.patient.AvatarLink != null ? x.patient.AvatarLink : "",
                    PrimaryAddress = new ServiceModels.Address() 
                    {
                        StreetLine = x.patientAddress.StreetLine
                    },
                    PrimaryContact = new ServiceModels.Contact()
                    {
                        Email = x.patientContact.Email,
                        PhoneNumber = x.patientContact.PhoneNumber
                    },
                }).ToList();

            var result = new PatientList()
            {
                Patients = data,
                TotalCount = totalRow
            };

            return result;
        }

        public async Task<int> GetPatientsSummary()
        {
            var NumberOfPatients = await _patientCheckInContext.Patients.ToListAsync();
            return NumberOfPatients.Count();
        }
    }
}
