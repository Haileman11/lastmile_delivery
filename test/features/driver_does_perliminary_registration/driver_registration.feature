Feature: Driver does preliminary registration

  Scenario Outline: Driver fails to register
    Given injection is setup
    And the app is on page {'/registration-page'}
    And I see {'first_name_field'}
    And I see {'last_name_field'}
    And I see {'phone_number_field'}
    And I see {'email_field'}
    When I enter <first_name> into {'first_name_field'} input field
    And I enter <last_name> into {'last_name_field'} input field
    And I enter <phone_number> into {'phone_number_field'} input field
    And I enter <email> into {'email_field'} input field
    Then I see <error_message>
    Examples:
      | first_name | last_name | phone_number | email                  | error_message              |
      | ''         | 'Tuha'    | '909525760'  | 'anwartuha2@gmail.com' | 'First name is required'   |
      | 'Anwar'    | ''        | '909525760'  | 'anwartuha2@gmail.com' | 'Last name is required'    |
      | 'Anwar'    | 'Tuha'    | ''           | 'anwartuha2@gmail.com' | 'Phone number is required' |
      | 'Anwar'    | 'Tuha'    | '909525760'  | ''                     | 'Email is required'        |
      | 'Anwar'    | 'Tuha'    | '909'        | 'anwartuha2@gmail.com' | 'Invalid phone number'     |
      | 'Anwar'    | 'Tuha'    | '909525760'  | 'anwartuha'            | 'Invalid email address'    |

  Scenario Outline: Driver registers successfully
    Given injection is setup
    And the app is on page {'/registration-page'}
    And I see {'first_name_field'}
    And I see {'last_name_field'}
    And I see {'phone_number_field'}
    And I see {'email_field'}
    When I enter <first_name> into {'first_name_field'} input field
    And I enter <last_name> into {'last_name_field'} input field
    And I enter <phone_number> into {'phone_number_field'} input field
    And I enter <email> into {'email_field'} input field
    Then I see {'REGISTER_PENDING_PAGE'}
    Examples:
      | first_name      | last_name | phone_number | email                  |
      | 'Anwar'         | 'Tuha'    | '909525760'  | 'anwartuha2@gmail.com' |