Feature: Clockify - Academy - Lippia Karate

  Background: Url y Headers
    Given url 'https://api.clockify.me/api/v1'
    And header X-Api-Key = 'ZWFhNDM1NzgtOTAxYy00NWE2LThjZDgtMmEzZjBiNmUxYzk4'
    And header Content-Type = 'application/json'

  @Practica @AddTimeEntry
  Scenario Outline: Agregar horas a un proyecto.
    * def body = read('classpath:examples/users/Requests/Add_Time_Entry_rq.json')
    Given path 'workspaces','<workspaceId>','time-entries'
    And request body
    When method POST
    Then status 201
    * def id = response.id

    Examples:
      | workspaceId              |
      | 628ceff638bc332cb91e6582 |