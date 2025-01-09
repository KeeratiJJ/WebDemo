*** Settings ***
Resource          resource.robot

*** Test Cases ***

Open Form
    Open Browser To Form Page
    [Teardown]    Close Browser

Record Success
    Open Browser To Form Page
    Input FirstName    Somsong
    Input LastName    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Click SubmitButton
    Welcome Page Should Be Open Complete
    [Teardown]    Close Browser

Empty Destination
    Open Browser To Form Page
    Input FirstName    Somsong
    Input LastName    Sandee
    Input Destination    ${EMPTY}
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Click SubmitButton
    Welcome Page Should Be Open Complete
    [Teardown]    Close Browser

Empty Email
    Open Browser To Form Page
    Input FirstName    Somsong
    Input LastName    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    ${EMPTY}
    Input Phone    081-111-1234
    Click SubmitButton
    Welcome Page Should Be Open Complete
    [Teardown]    Close Browser

Invalid Email
    Open Browser To Form Page
    Input FirstName    Somsong
    Input LastName    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@
    Input Phone    081-111-1234
    Click SubmitButton
    Welcome Page Should Be Open Complete
    [Teardown]    Close Browser

Empty Phone Number
    Open Browser To Form Page
    Input FirstName    Somsong
    Input LastName    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    ${EMPTY}
    Click SubmitButton
    Welcome Page Should Be Open Complete
    [Teardown]    Close Browser

Invalid Phone Number
    Open Browser To Form Page
    Input FirstName    Somsong
    Input LastName    Sandee
    Input Destination    Europe
    Input Contactperson    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    191
    Click SubmitButton
    Welcome Page Should Be Open Complete
    [Teardown]    Close Browser