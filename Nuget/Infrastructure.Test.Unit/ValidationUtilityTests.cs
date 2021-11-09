using Infrastructure.Utility;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Infrastructure.Test.Unit
{
    [TestClass]
    public class ValidationUtilityTests
    {
        [DataTestMethod]
        [DataRow("abc@abc.com", true)]
        [DataRow("abc.com", false)]
        [DataRow("abc@abc", false)]
        [DataRow("@abc.com", false)]
        [DataRow("abc@abd.", false)]
        public void EmailValidation_pass(string email, bool isValid)
        {
            if (isValid)
                Assert.IsTrue(ValidationUtility.IsValidEmail(email));
            else
                Assert.IsFalse(ValidationUtility.IsValidEmail(email));
        }
    }
}
