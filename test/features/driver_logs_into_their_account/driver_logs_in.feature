Feature: Driver logs into their account

  Background: Setup injection
    Given injection is setup
  After:
    Then clean up

 Scenario Outline: Driver fails to login
   Given the app is on page {'/login-page'}
   And I see {'phone_number_field'}
   When I enter <phone_number> into {'phone_number_field'} input field
   And I tap {'LOGIN_BUTTON'}
   Then I see <error_message>
   Examples:
     | phone_number | error_message                 |
     | ''           | 'error_message'               |

 Scenario Outline: Driver successfully logs in
   Given the app is on page {'/login-page'}
   And I see {'phone_number_field'}
   When I enter <phone_number> into {'phone_number_field'} input field
   And I tap {'LOGIN_BUTTON'}
   Then I see {'POD_PAGE_KEY'}
   When I enter {'1234'} into {'PIN_INPUT'} input field
   And I tap {'VERIFY_BUTTON'}
   And I see {'HOME_PAGE'}
   Examples:
     | phone_number |
     | '909525760'  |
