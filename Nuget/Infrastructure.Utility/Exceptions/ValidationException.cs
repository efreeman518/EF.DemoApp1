﻿using System;
using System.Runtime.Serialization;

namespace Infrastructure.Utility.Exceptions;

[Serializable]
public class ValidationException : Exception
{

    public ValidationException() : base()
    {
    }

    public ValidationException(string message) : base(message)
    {
    }

    public ValidationException(string message, Exception innerException) : base(message, innerException)
    {
    }

    protected ValidationException(SerializationInfo info, StreamingContext context) : base(info, context)
    { }
}
