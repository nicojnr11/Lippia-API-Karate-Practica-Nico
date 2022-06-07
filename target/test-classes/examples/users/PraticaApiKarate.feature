Feature: Clockify - Academy - Lippia Karate

  Background: Url y Headers
    Given url 'https://api.clockify.me/api/v1'
    And header X-Api-Key = 'ZWFhNDM1NzgtOTAxYy00NWE2LThjZDgtMmEzZjBiNmUxYzk4'
    And header Content-Type = 'application/json'

  @Practica
  Scenario Outline: Consultar proyecto por id.
    Given path 'workspaces','<workspaceId>','projects','<projectId>'
    When method GET
    Then status 200
    And match response.name == '<nameProject>'

    Examples:
      | workspaceId              | projectId                | nameProject  |
      | 628ceff638bc332cb91e6582 | 629fa4bb242893650e014b3c | KarateLippia |

  @Practica
  Scenario Outline: Agregar horas a un proyecto.
    * def body = read('classpath:examples/users/Requests/Add_Time_Entry_rq.json')
    Given path 'workspaces','<workspaceId>','time-entries'
    And request body
    When method POST
    Then status 201

    Examples:
      | workspaceId              |
      | 628ceff638bc332cb91e6582 |

  @Practica
  Scenario Outline: Editar un campo de algún registro de hora.
    * def responseAddTimeEntry = call read('classpath:examples/users/AddTimeEntry.feature')
    * def idTimeEntry = responseAddTimeEntry.id
    * def body = read('classpath:examples/users/Requests/Update_Time_Entry_rq.json')
    Given path 'workspaces','<workspaceId>','time-entries','idTimeEntry'
    When method PUT
    Then status 200

    Examples:
      | workspaceId              |
      | 628ceff638bc332cb91e6582 |

  @Practica
  Scenario Outline: Eliminar hora registrada.
    * def responseAddTimeEntry = call read('classpath:examples/users/AddTimeEntry.feature')
    * def idTimeEntry = responseAddTimeEntry.id
    Given path 'workspaces','<workspaceId>','time-entries','idTimeEntry'
    When method DELETE
    Then status 204

    Examples:
      | workspaceId              |
      | 628ceff638bc332cb91e6582 |













