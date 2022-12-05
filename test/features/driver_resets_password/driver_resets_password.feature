Feature: Driver resets password

  Background: Setup injection
    Given injection is setup
  After:
    Then clean up

  Scenario Outline: Driver fails to reset password
    Given the app is on page {'/reset-password-page'}
    And I see {'new_password_field'}
    And I see {'confirm_password_field'}
    When I enter <new_password> into {'new_password_field'} input field
    And I enter <confirm_password> into {'confirm_password_field'} input field
    And I tap {'RESET_PASSWORD'}
    Then I see <error_message> text
    Examples:
      | new_password      | confirm_password  | error_message                                    |
      | ''                | 'oldPassword@101' | 'please fill all required fields'                |
      | 'oldPassword@101' | ''                | 'please fill all required fields'                |
      | 'oldPassword@101' | 'fakePassword'    | 'confirmed password doesn\'t match new password' |

  Scenario Outline: Driver successfully resets password
    Given the app is on page {'/reset-password-page'}
    And I see {'new_password_field'}
    And I see {'confirm_password_field'}
    When I enter <new_password> into {'new_password_field'} input field
    And I enter <confirm_password> into {'confirm_password_field'} input field
    And I tap {'RESET_PASSWORD'}
    Then I see {'PROFILE_PAGE'}
    And I see {'Password reset successfully'} text
    Examples:
      | new_password      | confirm_password      |
      | 'oldPassword@101' | 'oldPassword@101' |
