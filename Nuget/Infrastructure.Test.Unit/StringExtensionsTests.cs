using Infrastructure.Utility.Extensions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Infrastructure.Test.Unit
{
    [TestClass]
    public class StringExtensionsTests
    {
        [DataTestMethod]
        [DataRow("testString", "testString")]
        [DataRow("TestString", "testString")]
        public void EmailValidation_pass(string input, string expected)
        {
            Assert.AreEqual(input.ToCamelCase(), expected);
        }
    }
}
