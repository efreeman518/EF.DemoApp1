using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;

namespace Package.Infrastructure.Utility.Extensions;

public static class LoggerExtensions
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="logger"></param>
    /// <param name="logLevel"></param>
    /// <param name="eventId"></param>
    /// <param name="message"></param>
    /// <param name="exception"></param>
    /// <param name="logData"></param>
    public static void Log(this ILogger logger, LogLevel logLevel, EventId eventId, string? message = null, Exception? exception = null, List<KeyValuePair<string, string?>>? logData = null)
    {
        //structured logging template - ignore src properties if null (background services do not have a request context)
        string logTemplate = "{TimeUTC}{SiteName}{ServerInstanceId}";
        //structured logging value array
        List<object?> logValues = new()
        {
            DateTime.UtcNow,
            //Azure App Services
            Environment.GetEnvironmentVariable("WEBSITE_SITE_NAME") ?? "",
            Environment.GetEnvironmentVariable("WEBSITE_INSTANCE_ID" ?? "")
        };

        if (message != null)
        {
            logTemplate += " {Message}";
            logValues.Add(message);
        }

        //any custom log data items
        logData?.ForEach(a =>
        {
            logTemplate += " {" + a.Key + "}";
            logValues.Add(a.Value);
        });

#pragma warning disable CA2254 // Template should be a static expression

        //structured logging - logTemplate {} items must match the values in logValues
        switch (logLevel)
        {
            case LogLevel.Critical:
                logger.LogCritical(eventId, exception, logTemplate, logValues.ToArray());

                break;
            case LogLevel.Debug:
                logger.LogDebug(eventId, exception, logTemplate, logValues.ToArray());
                break;
            case LogLevel.Information:
                logger.LogInformation(eventId, exception, logTemplate, logValues.ToArray());
                break;
            case LogLevel.Error:
                logger.LogError(eventId, exception, logTemplate, logValues.ToArray());
                break;
            case LogLevel.Trace:
                logger.LogTrace(eventId, exception, logTemplate, logValues.ToArray());
                break;
            case LogLevel.Warning:
                logger.LogWarning(eventId, exception, logTemplate, logValues.ToArray());
                break;
        }

#pragma warning restore CA2254 // Template should be a static expression

    }
}
