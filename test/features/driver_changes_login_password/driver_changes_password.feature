Feature: Driver changes password
  Background: Setup injection
    Given injection is setup
  After:
    Then clean up

  Scenario Outline: Driver fails to update password
    Given the app is on page {'/profile-page'}
    And I tap {'UPDATE_PASSWORD'}
    And I see {'old_password_field'}
    And I see {'new_password_field'}
    And I see {'confirm_password_field'}
    When I enter <old_password> into {'old_password_field'} input field
    And I enter <new_password> into {'new_password_field'} input field
    And I enter <confirm_new_password> into {'confirm_password_field'} input field
    And I tap {'UPDATE_PASSWORD_BUTTON'}
    Then I see <error_message> text
    Examples:
      | old_password      | new_password      | confirm_new_password | error_message                                    |
      | ''                | 'newPassword@101' | 'newPassword@101'    | 'please fill all required fields'                |
      | 'oldPassword@101' | ''                | 'newPassword@101'    | 'please fill all required fields'                |
      | 'oldPassword@101' | 'newPassword@101' | ''                   | 'please fill all required fields'                |
      | 'oldPassword@101' | 'newPassword@101' | 'fakePassword'       | 'confirmed password doesn\'t match new password' |

  Scenario Outline: Driver successfully updates password
    Given the app is on page {'/profile-page'}
    And I tap {'UPDATE_PASSWORD'}
    And I see {'old_password_field'}
    And I see {'new_password_field'}
    And I see {'confirm_password_field'}
    When I enter <old_password> into {'old_password_field'} input field
    And I enter <new_password> into {'new_password_field'} input field
    And I enter <confirm_new_password> into {'confirm_password_field'} input field
    And I tap {'UPDATE_PASSWORD_BUTTON'}
    Then I see {'PROFILE_PAGE'}
    And I see {'Password updated successfully'} text
    Examples:
      | old_password      | new_password      | confirm_new_password  |
      | 'oldPassword@101' | 'newPassword@101' | 'newPassword@101'     |