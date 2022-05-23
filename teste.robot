*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${first-name}         id=firstName
${last-name}          id=lastName
${adress}             id=currentAddress
${email_adress}       id=userEmail
${gender}             id=gender-radio-1
${image}              id=uploadPicture
${file}               C:\\Users\\Kaleby\\Pictures\\image.jpeg
${phone}              id=userNumber
${subjects}           id=subjectsInput
${hobbies}            css:input[value='1']
${butsub}             css:input[aria-autocomplete='list']
${Year}               css:select[class='react-datepicker__year-select']
${Month}              css:select[class='react-datepicker__month-select']
${Day}                css:div[aria-label='Choose Saturday, February 11th, 1995']
${state}              id=react-select-3-input
${city}               id=react-select-4-input


            
*** Keywords ***
Nova sessão
    Open Browser        https://demoqa.com/automation-practice-form        chrome

Preencher campos

    Input Text         ${first-name}       Kaleby
    Input Text         ${last-name}        Porfirio
    Input Text         ${email_adress}     kaleby@gmail.com
    Press Keys         ${gender}           Male
    Input Text         ${phone}            8586439162
    Press keys         ${phone}              TAB 
    Select From List by Label       ${Month}       February    
    Select From List by Value        ${Year}       1995   
    Press Keys         ${Day}     11       
    Input Text         ${subjects}      M
    Clear Element Text         ${subjects}     
    Input Text         ${butsub}   Maths
    Press Keys         ${butsub}     TAB    
    Press Keys         ${hobbies}       TAB
    Choose File        ${image}             ${file}  
    Input Text         ${adress}       Rua Bias Mendes, 1301, Fortaleza - CE
    Input Text         ${state}            NCR
    Press Keys         ${state}           TAB
    Input Text         ${city}            Noida
    Press Keys         ${city}           TAB 


Clica em Submit   

    Click Element       //button[@type="submit"]           Enter

Encerra sessão
    Sleep   3s
    Close Browser

*** Test Cases ***
Cenario 1
    Nova sessão
    Preencher campos
    Clica em Submit
    Encerra sessão
