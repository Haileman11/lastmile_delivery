Feature: Driver views transaction history
As a driver,
I want to view my transaction history, 
So that I can keep track of my finances.

  Background: Setup injection
    Given injection is setup
  After:
    Then clean up
    
  Scenario: Driver navigates to transaction history page
    Given the app is on {'/transaction-history-page'}
    Then I see {'TRANSACTION_HISTORY_PAGE'}
    And I see {'TRANSACTION_ITEM'}
  
  Scenario: Driver view transaction detail
    Given the app is on {'/transaction-history-page'}
    And I see {'TRANSACTION_HISTORY_PAGE'}
    And I see {'TRANSACTION_ITEM'}
    When I tap {'TRANSACTION_ITEM'}
    Then I see {'TRANSACTION_DETAIL_WIDGET'}
    