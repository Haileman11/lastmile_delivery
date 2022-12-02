Feature: Driver logs into their account

  Background: Setup injection
    Given injection is setup
  After:
    Then clean up

 Scenario Outline: Driver fails to login
   Given the app is on page {'/registration-page'}
   And I see {'phone_number_field'}
   And I see {'password_field'}
   When I enter <phone_number> into {'phone_number_field'} input field
   And I enter <password> into {'password_field'} input field
   And I tap {'LOGIN_BUTTON'}
   Then I see <error_message>
   Examples:
     | phone_number | password         | error_message                 |
     | '909525760'  | ''               | 'please fill in password'     |
     | ''           | 'helloWorld@101' | 'please fill in phone number' |

 Scenario Outline: Driver successfully logs in
   Given the app is on page {'/login-page'}
   And I see {'phone_number_field'}
   And I see {'password_field'}
   When I enter <phone_number> into {'phone_number_field'} input field
   And I enter <password> into {'password_field'} input field
   And I tap {'LOGIN_BUTTON'}
   Then I see {'VERIFICATION_PAGE_KEY'}
   Examples:
     | phone_number | password         |
     | '909525760'  | 'helloWorld@101' |
