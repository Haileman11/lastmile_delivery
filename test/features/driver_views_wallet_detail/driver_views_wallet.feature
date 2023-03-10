Feature: Driver views wallet details

  Background: Setup injection
    Given injection is setup
  After:
    Then clean up

  Scenario Outline: Driver views wallet detail
    Given the app is on page {'/menu-page'}
    And there exists a wallet with balance <wallet_balance>
    When I tap {'VIEW_WALLET'}
    Then I see {'WALLET_PAGE'}
    And I see <wallet_balance> text
    Examples:
      | wallet_balance |
      | '15,000'        |
      | '0'            |
      | '3,000'         |