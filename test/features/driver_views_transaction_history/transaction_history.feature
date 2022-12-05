Feature: Driver views transaction history
As a driver,
I want to view my transaction history, 
So that I can keep track of my finances.

  Background: Setup injection
    Given injection is setup

  Scenario: Driver navigates to transaction history page
    Given the app is on {'/transaction-history-page'}
    Then I see {'TRANSACTION_HISTORY_PAGE'}
    