using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace Desserts.Helpers
{
    public class FirebaseAuthenticationException : Exception
    {
        public string Code { get; set; }
        public string Message { get; set; }
        public List<FirebaseAuthenticationError> Errors { get; set; }

        public FirebaseAuthenticationException(string message, string responseJson)
            : base(message)
        {
            try
            {
                var response = JsonConvert.DeserializeObject<FirebaseAuthenticationErrorResponse>(responseJson);
                Code = response.Error.Code;
                Message = response.Error.Message;
                Errors = response.Error.Errors;
            }
            catch (Exception)
            {


            }

        }
    }

    public class FirebaseAuthenticationErrorResponse
    {
        public FirebaseAuthenticationErrorData Error { get; set; }
    }

    public class FirebaseAuthenticationErrorData
    {
        public string Code { get; set; }
        public string Message { get; set; }
        public List<FirebaseAuthenticationError> Errors { get; set; }
    }

    public class FirebaseAuthenticationError
    {
        public string Message { get; set; }
        public string Domain { get; set; }
        public string Reason { get; set; }
    }
}

