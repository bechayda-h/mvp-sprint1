Feature: Login
	add seller details in Profile page

##Description
#Scenario Outline: Edit the Description
#	Given user inputs description <description>
#	When user clicks the Save description button
#	Then a "Description has been saved successfully" message will pop up
#	Then Description will be updated
#	Examples:
#		| description |
#		| hello       |
#		| a           |
#		| 1           |
#Scenario: Description cannot be empty
#	Given user deletes all description
#	When user clicks the Save description button
#	Then a "Please, a description is required" message will pop up
#	And Description will not be accepted 
#Scenario: Maximum Description length is only 600 characters
#	Given user inputs 601 character long description
#	When user clicks the Save description button
#	Then only 600 characters will be saved in the Description
#
##Language
#Scenario: Add a Language
#	Given user clicks the Language Tab
#	And user clicks Add New language button
#	And user inputs a language name
#	And user inputs a language level
#	When user clicks Add language button
#	Then a language has been added message will pop up
#	And new language will be added
#Scenario: Cancel a Language Add
#	Given user clicks the Language Tab
#	And user clicks Add New language button
#	And user inputs a language name
#	And user inputs a language level
#	When user clicks the Cancel add language button
#	Then new language will not be added
#Scenario Outline: Edit a Language
#	Given user clicks the Language Tab
#	And user clicks the language Write Icon
#	And user updates the language name to "Another Language"
#	And user updates the language level to <language level>
#	When user clicks the Update language button
#	Then a language has been updated message will pop up
#	And language detail will be updated
#	Examples:
#	| language level   |
#	| Basic            |
#	| Conversational   |
#	| Fluent           |
#	| Native/Bilingual |
#Scenario: Cancel a Language Edit
#	Given user clicks the Language Tab
#	And user clicks the language Write Icon
#	And user updates the language name
#	And user updates the language level
#	When user clicks the Cancel language button
#	Then language detail will not be updated
#Scenario: Improper Language name input cannot be accepted
#	Given user clicks the Language Tab
#	And user clicks the language Write Icon
#	And user inputs blank language name
#	When user clicks the Update language button
#	Then a "Please enter language and level" message will pop up
#	And language detail will not be updated
#Scenario: Improper Language level input cannot be accepted during adding of new language
#	Given user clicks the Language Tab
#	And user clicks Add New language button
#	And user inputs a language name
#	And user selects "Choose Language Level" as Level
#	When user clicks Add language button
#	Then a "Please enter language and level" message will pop up
#	And language detail will not be updated
#Scenario: Improper Language level input cannot be accepted during edit
#	Given user clicks the Language Tab
#	And user clicks the language Write Icon
#	And user selects "Language Level" as Level
#	When user clicks the Update language button
#	Then a "Please enter language and level" message will pop up
#	And language detail will not be updated
#Scenario: Updating a Langauge entry without changing the language name and level cannot be accepted
#	Given user clicks the Language Tab
#    And user clicks the language Write Icon
#	When user clicks the Update language button
#	Then a this language is already added message will pop up
#Scenario: Delete a Language
#	Given user clicks the Language Tab
#	When user clicks the Delete language button
#	Then a "Russian has been deleted from your languages" message will pop-up
#	And a language entry will be deleted
##Language: Bug Case?? 
#Scenario: Duplicate Language entry must be detected during edit
#	Given user clicks the Language Tab
#	And all language entries are removed
#	And a language entry named "English" and level "Basic" is added
#	And a language entry named "Spanish" and level "Conversational" is added
#	When user makes the language name the same for both entries
#	Then a "This language is already exist in your language list." message will pop up
#	And language detail will not be updated
#Language: My 3 chosen complex test cases
Scenario Outline: Duplicate Language entry cannot be accepted when inputting a new language
	Given user clicks the Language Tab
	And all language entries are removed
	And a language entry named <language1> and level <level1> is added
	When another language entry named <language2> and level <level2> is added
	Then a "<message>" message will pop up
	And language will not be added
	Examples:
	| language1 | level1 | language2 | level2 | message                                               |
	| English   | Basic  | English   | Basic  | This language is already exist in your language list. |
	| English   | Basic  | English   | Fluent | Duplicated data                                       |

Scenario: Add New button in language tab will disappear when there are four languages listed
	Given user clicks the Language Tab
	And all language entries are removed
	When four language entries are added
	Then the Add New language button will disappear
Scenario: Add New button in language tab will reappear when there are less than four languages listed
	Given user clicks the Language Tab
	And all language entries are removed
	And four language entries are added
	When a language entry is removed
	Then the Add New language button will reappear

##Skill
#Scenario: Add a Skill
#	Given user clicks the Skills Tab
#	And user clicks Add New skill button
#	And user inputs skill name
#	And user inputs skill level
#	When user clicks Add skill button
#	Then a skill added successfully message will pop up
#	And a new skill will be added
#Scenario: Cancel a Skill Add
#	Given user clicks the Skills Tab
#	And user clicks Add New skill button
#	And user inputs skill name
#	And user inputs skill level
#	When user clicks the Cancel add skill button
#	Then a new skill will not be added
#Scenario Outline: Edit a Skill
#	Given user clicks Skills Tab
#	And user clicks the skill Write Icon
#	And user updates the skill name to "Another Skill"
#	And user updates the skill level to <skill level>
#	When user clicks the Update skill button
#	Then a skill updated successfully message will pop up
#	And the skill name and level is updated
#	Examples:
#	| skill level  |
#	| Beginner     |
#	| Intermediate |
#	| Expert       |
#Scenario: Cancel a Skill Edit
#	Given user clicks Skills Tab
#	And user clicks the skill Write Icon
#	And user updates the skill name
#	And user updates the skill level
#	When user clicks the Cancel skill button
#	Then the skill name and level will not be updated
#Scenario: Improper Skill name input cannot be accepted
#	Given user clicks Skills Tab
#	And user clicks the skill Write Icon
#	And user inputs blank skill name
#	When user clicks the Update skill button
#	Then a skill warning message will pop up
#	And skill will not be updated
#Scenario: Improper Skill level input cannot be accepted during adding of new skill
#	Given user clicks the Language Tab
#	And user clicks Add New skill button
#	And user inputs a skill name
#	And user selects "Choose Skill Level" as Level
#	When user clicks Add skill button
#	Then a "Please enter skill and experience level" message will pop up
#	And skill will not be updated
#Scenario: Improper Skill level input cannot be accepted during Edit
#	Given user clicks Skills Tab
#	And user clicks the skill Write Icon
#	And user selects "Skill Level" as Level
#	When user clicks the Update skill button
#	Then a "Please enter skill and experience level" message will pop up
#	And skill will not be updated
#Scenario: Duplicate Skill cannot be accepted
#	Given user clicks the Skills Tab
#	And user clicks Add New skills button
#	And user inputs the same skill name from an existing one
#	When user clicks Update skill button
#	Then a "This skill is already exists in your skill list" message will pop up
#	And skill will not be updated
#Scenario: Updating a skill entry without changing the skill name and level cannot be accepted
#	Given user clicks the Skills Tab
#    And user clicks the language Write Icon
#	When user clicks the Update language button
#	Then  a warning message "This skill is already added to your skill list." will pop up
#Scenario: Delete a Skill
#	Given user clicks Skills Tab
#	When user clicks the Delete skill button
#	Then a skill deleted message will pop-up
#	And The skill entry will be deleted
#Scenario: Duplicate Skill entry must be detected during edit
#	Given user clicks the Language Tab
#	And all language entries are removed
#	And a skill entry named "skill 1" and level "Basic" is added
#	And a skill entry named "skill 2" and level "Conversational" is added
#	When user makes the skill name the same for both entries
#	Then a "This skill is already exists in your skill list" message will pop up
#	And skill detail will not be updated
#
##Education
#Scenario Outline: Add an Education
#	Given user clicks the Education Tab
#	And user clicks Add New education button
#	And user inputs country as <country>
#	And user inputs university
#	And user inputs title as <title>
#	And user inputs degree
#	And user inputs graduation year as <grad year>
#	When user clicks Add education button
#	Then a "Education has been added" message will pop up
#	And new education will be added
#	Examples:
#	| country     | title     | grad year |
#	| Afghanistan | PHD       | 2021      |
#	| Zimbabwe    | B.TEch    | 1991      |
#	| Japan       | Associate | 2007      |
#Scenario: Cancel an Education Add
#	Given user clicks the Education Tab
#	And user clicks Add New education button
#	And user inputs country
#	And user inputs university
#	And user inputs title
#	And user inputs degree
#	And user inputs graduation year
#	When user clicks Cancel add education button
#	Then new education will not be added
#Scenario: Edit an Education
#	Given user clicks the Education Tab
#	And user clicks the education Write Icon
#	And user updates country
#	And user updates university
#	And user updates title
#	And user updates degree
#	And user updates graduation year
#	When user clicks Update education button
#	Then a "Education has been updated" message will pop up
#	And education detail will be updated
#Scenario: Improper University Name input cannot be accepted
#	Given user clicks the Education Tab
#	And user clicks the education Write Icon
#	And user updates university name with blank
#	When user clicks Update education button
#	Then a "Please enter all fields" message will pop up
#	And education detail will not be updated
#Scenario: Improper Country input cannot be accepted
#	Given user clicks the Education Tab
#	And user clicks the education Write Icon
#	And user selects "Country of College/University" as country
#	When user clicks Update education button
#	Then a "Please enter all fields" message will pop up
#	And education detail will not be updated
#Scenario: Improper Title input cannot be accepted
#	Given user clicks the Education Tab
#	And user clicks the education Write Icon
#	And user selects "Title" as title
#	When user clicks Update education button
#	Then a "Please enter all fields" message will pop up
#	And education detail will not be updated
#Scenario: Improper Degree input cannot be accepted
#	Given user clicks the Education Tab
#	And user clicks the education Write Icon
#	And user updates degree with blank
#	When user clicks Update education button
#	Then a "Please enter all fields" message will pop up
#	And education detail will not be updated
#Scenario: Improper Graduation Year input cannot be accepted
#	Given user clicks the Education Tab
#	And user clicks the education Write Icon
#	And user selects "Year of graduation" as graduation year
#	When user clicks Update education button
#	Then a "Please enter all fields" message will pop up
#	And education detail will not be updated
#Scenario: Duplicate Education cannot be accepted during edit
#	Given user clicks the Education Tab
#	And user clicks the education Write Icon
#	And user inputs the same education details from an existing one
#	When user clicks Update education button
#	Then a "This information already exist" message will pop up
#	And education will not be updated
#Scenario: Duplicate Education cannot be accepted during adding of new education
#	Given user clicks the Education Tab
#	And user clicks Add New education button
#	And user inputs the same education details from an existing one
#	When user clicks Add education button
#	Then a "This information already exist" message will pop up
#	And education will not be added
#Scenario: Delete an Education
#	Given user clicks Education Tab
#	When user clicks the Delete education button
#	Then a "Education entry successfully removed" message will pop-up
#	Then The education entry will be deleted
#	
##Certification
#Scenario: Add a Certification
#	Given user clicks the Certifications Tab
#	And user clicks Add New certification button
#	And user inputs certificate award
#	And user inputs certificate from
#	And user selects a year
#	When user clicks Add certification button
#	Then a certification added successfully message will pop up
#	Then new certification will be added
#Scenario: Cancel a Certification Add
#	Given user clicks the Certifications Tab
#	And user clicks Add New certification button
#	And user inputs certificate award
#	And user inputs certificate from
#	And user selects a year
#	When user clicks Cancel add certification button
#	Then new certification will not be added
#Scenario Outline: Edit a Certification
#	Given user clicks the Certifications Tab
#	And user clicks certification Write Icon
#	And user updates certificate award
#	And user updates certificate from
#	And user updates year to <year>
#	When user clicks Update certification button
#	Then a certification updated successfully message will pop up
#	And certification will be updated
#	Examples:
#	| year |
#	| 2021 |
#	| 2001 |
#	| 2010 |
#Scenario: Cancel a Certification Edit 
#	Given user clicks the Certifications Tab
#	And user clicks certification Write Icon
#	And user updates certificate award
#	And user updates certificate from
#	And user updates year to <year>
#	When user clicks Cancel edit certification button
#	Then certification will not be updated
#Scenario: Improper Certificate input cannot be accepted
#	Given user clicks the Certifications Tab
#	And user clicks certification Write Icon
#	And user updates certificate award with blank
#	When user clicks Update certification button
#	Then a "Please enter Certification Name, Certification From and Certification Year" message will pop up
#	And certification will not be updated
#Scenario: Improper Certificate From input cannot be accepted
#	Given user clicks the Certifications Tab
#	And user clicks certification Write Icon
#	And user updates certificate from with blank
#	When user clicks Update certification button
#	Then a "Please enter Certification Name, Certification From and Certification Year" message will pop up
#	And certification will not be updated
#Scenario: Improper Year input cannot be accepted
#	Given user clicks the Certifications Tab
#	And user clicks certification Write Icon
#	And user selects Year as year
#	When user clicks Update certification button
#	Then a "Please enter Certification Name, Certification From and Certification Year" message will pop up
#	And certification will not be updated
#Scenario: Duplicate Certification cannot be accepted
#	Given user clicks the Certifications Tab
#	And user clicks Add New certification button
#	And user inputs the same certification details from an existing one
#	When user clicks Update certification button
#	Then a "This information is already exist" message will pop up
#	And certification will not be updated
#Scenario: Delete a Certification
#	Given user clicks Certifications Tab
#	When user clicks the Delete certification button
#	Then a certification deleted message will pop-up
#	And The certification entry will be deleted
#
##Name
#Scenario: Edit First and Last Name
#	Given user clicks the Name dropdown icon
#	And user updates the first name
#	And user updates the last name
#	When user clicks the Save name button
#	Then the first name and last name will be updated
#Scenario: Blank First Name cannot be accepted
#	Given user clicks the Name dropdown icon
#	And user updates the first name with blank
#	When user clicks the Save name button
#	Then the first name will not be updated
#	And a name warning message will pop up
#Scenario: Blank Last Name cannot be accepted
#	Given user clicks the Name dropdown icon
#	And user updates the last name with blank
#	When user clicks the Save name button
#	Then the last name will not be updated
#	And a name warning message will pop up
#
##Availability
#Scenario: Cancel Edit Availability
#	Given user clicks the Availability write icon
#	When user clicks the Availability remove icon
#	Then Availability will not be updated
#Scenario Outline: Edit Availability
#	Given user clicks the Availability write icon
#	And user updates Availability to <availability>
#	Then a "Availability updated" message will pop up
#	And Availability will be updated
#	Examples:
#		| availability |
#		| Full Time    |
#		| Part Time    |
#
##Hours
#Scenario: Cancel Edit Hours
#	Given user clicks the Hours write icon
#	When user clicks the Hours remove icon
#	Then Hours will not be updated
#Scenario Outline: Edit Hours
#	Given user clicks the Hours write icon
#	And user updates Hours to <hours>
#	Then a "Availability updated" message will pop up
#	And Hours will be updated
#	Examples:
#		| hours                    |
#		| Less than 30hours a week |
#		| More than 30hours a week |
#		| As needed                |
#
##Earn Target
#Scenario: Cancel Edit Earn Target
#	Given user clicks the Earn Target write icon
#	When user clicks the Earn Target remove icon
#	Then Earn Target will not be updated	
#Scenario Outline: Edit Earn Target
#	Given user clicks the Earn Target write icon
#	And user updates Earn Target to <earn target>
#	Then a "Availability updated" message will pop up
#	Then Earn Target will be updated
#	Examples:
#		| earn target                      |
#		| Less than $500 per month         |
#		| Between $500 and $1000 per month |
#		| More than $1000 per month        |