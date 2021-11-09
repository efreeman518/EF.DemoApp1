using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;

namespace Application.Services
{
    public abstract class ServiceBase
    {
        protected readonly ILogger<ServiceBase>? Logger;

        public ServiceBase(ILogger<ServiceBase>? logger)
        {
            Logger = logger;
        }

        protected void Log(LogLevel logLevel, string message, int eventId = 0, Exception? ex = null, List<KeyValuePair<string, string?>>? logData = null)
        {
            if (Logger == null) return; 
            Logger.Log(logLevel, eventId, message, ex, logData);
        }
    }
}
