using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using MarsQA_1.Helpers;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;

namespace MarsQA_1.SpecflowPages.Pages
{
    public static class Profile
    {
        public  static readonly string XpathLanguageAddNewButton = "//div[@id='account-profile-section']/div/section[2]/div/div/div/div[3]/form/div[2]/div/div[2]/div/table/thead/tr/th[3]/div";
        private static readonly string XpathLanguageNameList1 = "//*[@id='account-profile-section']/div/section[2]/div/div/div/div[3]/form/div[2]/div/div[2]/div/table/tbody[1]/tr/td[1]";
        public  static readonly string XpathLanguageNameList2 = "//*[@id='account-profile-section']/div/section[2]/div/div/div/div[3]/form/div[2]/div/div[2]/div/table/tbody[2]/tr/td[1]";
        public  static readonly string XpathLanguageLevelList2 = "//*[@id='account-profile-section']/div/section[2]/div/div/div/div[3]/form/div[2]/div/div[2]/div/table/tbody[2]/tr/td[2]";

        public  static IWebElement PopupMessage => Driver.driver.FindElement(By.XPath("/html/body/div/div[@class='ns-box-inner']"));
        public  static IWebElement PopupRemoveIcon => Driver.driver.FindElement(By.XPath("/html/body/div/a"));

        public  static IWebElement LanguageTab => Driver.driver.FindElement(By.XPath("//div[@id=\'account-profile-section\']/div/section[2]/div/div/div/div[3]/form/div/a"));
        public  static IWebElement LanguageAddNewButton => Driver.driver.FindElement(By.XPath(XpathLanguageAddNewButton));
        private static IWebElement LanguageName => Driver.driver.FindElement(By.XPath("//div[@id='account-profile-section']/div/section[2]/div/div/div/div[3]/form/div[2]/div/div[2]/div/div/div/input"));
        private static IWebElement LanguageLevel => Driver.driver.FindElement(By.XPath("//select[@name=\'level\']"));
        public  static IWebElement LanguageAddButton => Driver.driver.FindElement(By.XPath("//div[@id=\'account-profile-section\']/div/section[2]/div/div/div/div[3]/form/div[2]/div/div[2]/div/div/div[3]/input"));

        public  static IWebElement LanguageRemoveIconList1 => Driver.driver.FindElement(By.XPath("//*[@id='account-profile-section']/div/section[2]/div/div/div/div[3]/form/div[2]/div/div[2]/div/table/tbody/tr/td[3]/span[2]/i"));
                
        public static void DeleteAllLanguages()
        {
            int count = Driver.driver.FindElements(By.XPath(XpathLanguageNameList1)).Count();
            while (count != 0)
            {
                LanguageRemoveIconList1.Click();
                Thread.Sleep(400);
                PopupRemoveIcon.Click();
                count = Driver.driver.FindElements(By.XPath(XpathLanguageNameList1)).Count();
            }
        }

        public static void DeleteLanguageList1()
        {
            LanguageRemoveIconList1.Click();
            Thread.Sleep(200);
            PopupRemoveIcon.Click();
        }

        public static void AddOneLanguageEntry(string language, string level)
        {
            LanguageAddNewButton.Click();
            LanguageName.SendKeys(language);
            LanguageLevel.FindElement(By.XPath($"//option[. = '{level}']")).Click();
            LanguageAddButton.Click();
            Thread.Sleep(100);
            PopupRemoveIcon.Click();
        }

        public static void AddAnotherLanguageEntry(string language, string level)
        {
            LanguageAddNewButton.Click();
            LanguageName.SendKeys(language);
            LanguageLevel.FindElement(By.XPath($"//option[. = '{level}']")).Click();
            LanguageAddButton.Click();
            Thread.Sleep(300);
        }

        public static void AssertThatElementDoesNotExist(string xpath)
        {
            Assert.True(Driver.driver.FindElements(By.XPath(xpath)).Count() == 0);
        }

        public static void AssertThatElementExist(string xpath)
        {
            Assert.True(Driver.driver.FindElements(By.XPath(xpath)).Count() == 1);
        }

        public static void AssertWarningMessage(string message)
        {
            Assert.AreEqual(PopupMessage.Text , message);
        }
    }
}
