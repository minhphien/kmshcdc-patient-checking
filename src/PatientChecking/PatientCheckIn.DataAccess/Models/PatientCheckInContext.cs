﻿using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace PatientCheckIn.DataAccess.Models
{
    public partial class PatientCheckInContext : DbContext
    {
        public PatientCheckInContext()
        {
        }

        public PatientCheckInContext(DbContextOptions<PatientCheckInContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Appointment> Appointments { get; set; }
        public virtual DbSet<EmergencyContact> EmergencyContacts { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<ProvinceCity> ProvinceCities { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=localhost;Database=PatientCheckIn;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Address>(entity =>
            {
                entity.ToTable("Address");

                entity.Property(e => e.AddressId).HasColumnName("AddressID");

                entity.Property(e => e.StreetLine)
                    .IsRequired()
                    .HasMaxLength(150)
                    .HasColumnName("Address");

                entity.Property(e => e.PatientId).HasColumnName("PatientID");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Addresses)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Address__Patient__29572725");
            });

            modelBuilder.Entity<Appointment>(entity =>
            {
                entity.ToTable("Appointment");

                entity.Property(e => e.AppointmentId).HasColumnName("AppointmentID");

                entity.Property(e => e.CheckInDate).HasColumnType("datetime");

                entity.Property(e => e.MedicalConcerns).HasMaxLength(100);

                entity.Property(e => e.PatientId).HasColumnName("PatientID");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Appointments)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Appointme__Patie__267ABA7A");
            });

            modelBuilder.Entity<EmergencyContact>(entity =>
            {
                entity.HasKey(e => e.EmergencyId)
                    .HasName("PK__Emergenc__7B5544331181EFB5");

                entity.ToTable("EmergencyContact");

                entity.Property(e => e.EmergencyId).HasColumnName("EmergencyID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.PatientId).HasColumnName("PatientID");

                entity.Property(e => e.PhoneNumber)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.Relationship)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.EmergencyContacts)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Emergency__Patie__2C3393D0");
            });

            modelBuilder.Entity<Patient>(entity =>
            {
                entity.ToTable("Patient");

                entity.Property(e => e.PatientId).HasColumnName("PatientID");

                entity.Property(e => e.AvatarLink).HasMaxLength(300);

                entity.Property(e => e.BirthplaceCity).HasMaxLength(50);

                entity.Property(e => e.DoB).HasColumnType("date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.EthnicRace).HasMaxLength(50);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.HomeTown).HasMaxLength(50);

                entity.Property(e => e.IdcardNo)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("IDCardNo");

                entity.Property(e => e.InsuranceNo)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.IssuedDate).HasColumnType("date");

                entity.Property(e => e.IssuedPlace).HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.MiddleName).HasMaxLength(50);

                entity.Property(e => e.Nationality)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.PatientIdentifier)
                    .IsRequired()
                    .HasMaxLength(8);

                entity.Property(e => e.PhoneNumber)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProvinceCity>(entity =>
            {
                entity.ToTable("ProvinceCity");

                entity.Property(e => e.ProvinceCityId).HasColumnName("ProvinceCityID");

                entity.Property(e => e.ProvinceCityName)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
