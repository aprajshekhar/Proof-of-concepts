Feature: Verify that the registry supports status check
  Scenario: Verifies that on status check, the resource returns true
    Given Registry exists that supports status check
    When I check the status
    Then I should get a 200
    And the response should contain true