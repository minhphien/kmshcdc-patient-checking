﻿using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PatientChecking.Services.Repository
{
    public interface IImageService
    {
        string SaveImage(IFormFile formFile);
        bool IsImageFile(IFormFile formFile);
    }
}