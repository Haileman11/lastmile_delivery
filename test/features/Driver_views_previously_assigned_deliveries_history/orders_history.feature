Feature: Driver views previously assigned deliveries history

  Background: Setup injection
    Given injection is setup

  Scenario: Driver navigates to order history page
    Given the app is on {'/order-history-page'}
    Then I see {'ORDERS_HISTORY_PAGE'}
    And I see {'ORDER_HISTORY_ITEM'}