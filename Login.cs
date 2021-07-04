using MarsQA_1.Helpers;
using MarsQA_1.SpecflowPages.Pages;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Threading;
using TechTalk.SpecFlow;

namespace MarsQA_1.Feature
{
    [Binding]
    public class LoginSteps : Driver
    {
        [Given(@"user clicks the Language Tab")]
        public void GivenUserClicksTheLanguageTab()
        {
            Profile.LanguageTab.Click();
        }

        [Given(@"all language entries are removed")]
        public void GivenAllLanguageEntriesAreRemoved()
        {
            Profile.DeleteAllLanguages();
        }

        [Given(@"a language entry named (.*) and level (.*) is added")]
        public void GivenALanguageEntryNamedAndLevelIsAdded(string p0, string p1)
        {
            Profile.AddOneLanguageEntry(p0, p1);
        }

        [When(@"another language entry named (.*) and level (.*) is added")]
        public void WhenAnotherLanguageEntryNamedAndLevelIsAdded(string p0, string p1)
        {
            Profile.AddAnotherLanguageEntry(p0, p1);
        }

        [Then(@"language will not be added")]
        public void ThenLanguageWillNotBeAdded()
        {
            Assert.Multiple(() =>
            {
               Profile.AssertThatElementDoesNotExist(Profile.XpathLanguageNameList2);
               Profile.AssertThatElementDoesNotExist(Profile.XpathLanguageLevelList2);
            });
        }

        [Then(@"a ""(.*)"" message will pop up")]
        public void ThenWarningMessageWillPopUp(string p0)
        {
            Profile.AssertWarningMessage(p0);
        }

        [When(@"four language entries are added")]
        public void WhenLanguageEntriesAreAdded()
        {
            Profile.AddOneLanguageEntry("English", "Basic");
            Profile.AddOneLanguageEntry("Russian", "Conversational");
            Profile.AddOneLanguageEntry("Chinese", "Fluent");
            Profile.AddOneLanguageEntry("Japanese", "Native/Bilingual");
        }

        [Then(@"the Add New language button will disappear")]
        public void ThenTheAddNewLanguageButtonWillBeGone()
        {
            Profile.AssertThatElementDoesNotExist(Profile.XpathLanguageAddNewButton);
        }

        [Given(@"four language entries are added")]
        public void GivenFourLanguageEntriesAreAdded()
        {
            Profile.AddOneLanguageEntry("English", "Basic");
            Profile.AddOneLanguageEntry("Russian", "Conversational");
            Profile.AddOneLanguageEntry("Chinese", "Fluent");
            Profile.AddOneLanguageEntry("Japanese", "Native/Bilingual");
        }

        [When(@"a language entry is removed")]
        public void WhenALanguageEntryIsRemoved()
        {
            Profile.DeleteLanguageList1();
        }

        [Then(@"the Add New language button will reappear")]
        public void ThenTheAddNewLanguageButtonWillReappear()
        {
            Profile.AssertThatElementExist(Profile.XpathLanguageAddNewButton);
        }

    }
}
