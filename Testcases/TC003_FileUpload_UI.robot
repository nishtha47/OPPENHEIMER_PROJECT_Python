*** Settings ***
Documentation  File Upload Download in Robot Framework
Library  SeleniumLibrary
Library   OperatingSystem

*** Variables ***
${UploadFiletest}   xpath://input[@type='file']
${FILE_TO_UPLOAD}   sample_data.csv

*** Test Cases ***
Verify File Upload
    [documentation]  This test case verifies that a user can successfully upload a file
    [tags]  Regression
    Open Browser  http://localhost:8080/    Chrome

Upload the File
    [documentation]  This test case verifies that a user can successfully SELECT a file
    [tags]  Regression
    Wait Until Page Contains Element    ${UploadFiletest}   60s
    Wait Until Element is enabled   ${UploadFiletest}
   # Click Element   xpath://input[@type='file']
       
    Choose File  ${UploadFiletest}  ${CURDIR}${/}${FILE_TO_UPLOAD}

Upload Selected File
    [documentation]  This test case verifies that a user can successfully verify uploaded file
    [tags]  Regression
    Click Element   xpath://div/span[text()='Upload CSV file']
   # Wait Until Element Is Visible  id:file-submit  timeout=5
    Element Text Should Be  xpath://div/table[@class='table table-hover table-dark']/caption  List of working class heroes and their tax relief
    Close Browser