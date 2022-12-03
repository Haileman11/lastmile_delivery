Feature: Driver changes password
  Background: Setup injection
    Given injection is setup
  After:
    Then clean up

  Scenario Outline: Driver fails to update password
    Given the app is on page {'/change-password-page'}
    And I see {'old_password'}
    And I see {'new_password'}
    And I see {'confirm_new_password'}
    When I enter <old_password> into {'old_password'} input field
    And I enter <new_password> into {'new_password'} input field
    And I enter <confirm_new_password> into {'confirm_new_password'} input field
    And I tap {'UPDATE_PASSWORD_BUTTON'}
    Then I see <error_message> text
    Examples:
      | old_password      | new_password      | confirm_new_password | error_message                                    |
      | ''                | 'newPassword@101' | 'newPassword@101'    | 'please fill all required fields'                |
      | 'oldPassword@101' | ''                | 'newPassword@101'    | 'please fill all required fields'                |
      | 'oldPassword@101' | 'newPassword@101' | ''                   | 'please fill all required fields'                |
      | 'oldPassword@101' | 'newPassword@101' | 'fakePassword'       | 'confirmed password doesn\'t match new password' |

  Scenario Outline: Driver successfully updates password
    Given the app is on page {'/change-password-page'}
    And I see {'old_password'}
    And I see {'new_password'}
    And I see {'confirm_new_password'}
    When I enter <old_password> into {'old_password'} input field
    And I enter <new_password> into {'new_password'} input field
    And I enter <confirm_new_password> into {'confirm_new_password'} input field
    And I tap {'UPDATE_PASSWORD_BUTTON'}
    Then I see {'PASSWORD_UPDATED'}
    And I see {'HOME_PAGE'}
    Examples:
      | old_password      | new_password      | confirm_new_password  |
      | 'oldPassword@101' | 'newPassword@101' | 'newPassword@101'     |