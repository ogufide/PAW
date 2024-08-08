﻿using API.Entities;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace API.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class ErrorController : ControllerBase
    {
        [Route("CatchError")]
        public IActionResult CatchError()
        {
            var context = HttpContext.Features.Get<IExceptionHandlerFeature>();

            return Problem(detail: context!.Error.Message, title: context.Path);



        }
    }
}
