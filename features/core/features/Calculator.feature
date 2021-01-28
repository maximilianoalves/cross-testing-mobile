@operations
Feature: Do calculator

  Scenario Outline: : Operations for two values
    Given User see the Calculator
    And User put first value <firstValue>
    And User put second value <secondValue>
    When User select <operator>
    Then The result should be <result>
    Examples:
      | firstValue | secondValue | operator | result |
      |1           |2            |"sum"     |3       |
      |5           |2            |"subtract"|3       |
      |10          |2            |"multiply"|20      |
      |10          |2            |"divide"  |5       |