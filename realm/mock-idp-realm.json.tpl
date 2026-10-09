{
  "id": "mock-idp",
  "realm": "mock-idp",
  "displayName": "Mock Oakland IdP",
  "enabled": true,
  "sslRequired": "external",
  "registrationAllowed": false,
  "loginWithEmailAllowed": true,
  "duplicateEmailsAllowed": false,
  "resetPasswordAllowed": false,
  "editUsernameAllowed": false,
  "accessTokenLifespan": 300,
  "ssoSessionIdleTimeout": 1800,
  "ssoSessionMaxLifespan": 36000,
  "defaultSignatureAlgorithm": "RS256",
  "browserSecurityHeaders": {
    "xFrameOptions": "SAMEORIGIN",
    "xContentTypeOptions": "nosniff"
  },
  "components": {
    "org.keycloak.userprofile.UserProfileProvider": [
      {
        "id": "f1e2d3c4-b5a6-7890-fedc-ba0987654321",
        "name": "declarative-user-profile",
        "providerId": "declarative-user-profile",
        "subComponents": {},
        "config": {
          "kc.user.profile.config": [
            "{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]}},{\"name\":\"email\",\"displayName\":\"${email}\",\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]}},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]}},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]}}],\"unmanagedAttributePolicy\":\"ADMIN_EDIT\"}"
          ]
        }
      }
    ],
    "org.keycloak.keys.KeyProvider": [
      {
        "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567800",
        "name": "rsa",
        "providerId": "rsa",
        "subComponents": {},
        "config": {
          "privateKey": [
            "__MOCK_IDP_RSA_PRIVATE_KEY__"
          ],
          "certificate": [
            "__MOCK_IDP_CERT__"
          ],
          "keyUse": [
            "SIG"
          ],
          "priority": [
            "100"
          ],
          "algorithm": [
            "RS256"
          ]
        }
      }
    ]
  },
  "clients": [
    {
      "id": "b2c3d4e5-f6a7-8901-bcde-f01234567801",
      "clientId": "https://keycloak.zeroverify.net/realms/zeroverify",
      "name": "ZeroVerify SP",
      "description": "ZeroVerify Keycloak acting as SAML service provider",
      "enabled": true,
      "protocol": "saml",
      "redirectUris": [
        "https://keycloak.zeroverify.net/realms/zeroverify/broker/mock-idp/endpoint"
      ],
      "attributes": {
        "saml.assertion.signature": "true",
        "saml.server.signature": "true",
        "saml.force.post.binding": "true",
        "saml.client.signature": "false",
        "saml.encrypt": "false",
        "saml.authnstatement": "true",
        "saml_assertion_consumer_url_post": "https://keycloak.zeroverify.net/realms/zeroverify/broker/mock-idp/endpoint",
        "saml_name_id_format": "email"
      },
      "protocolMappers": [
        {
          "id": "c3d4e5f6-a7b8-9012-cdef-012345678801",
          "name": "eppn",
          "protocol": "saml",
          "protocolMapper": "saml-user-attribute-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:1.3.6.1.4.1.5923.1.1.1.6",
            "attribute.nameformat": "URI Reference",
            "user.attribute": "eppn",
            "friendly.name": "eduPersonPrincipalName"
          }
        },
        {
          "id": "d4e5f6a7-b8c9-0123-def0-123456789801",
          "name": "enrollment-status",
          "protocol": "saml",
          "protocolMapper": "saml-user-attribute-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:1.3.6.1.4.1.5923.1.1.1.1",
            "attribute.nameformat": "URI Reference",
            "user.attribute": "enrollment_status",
            "friendly.name": "eduPersonAffiliation"
          }
        },
        {
          "id": "e5f6a7b8-c9d0-1234-ef01-234567890801",
          "name": "given-name",
          "protocol": "saml",
          "protocolMapper": "saml-user-attribute-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:2.5.4.42",
            "attribute.nameformat": "URI Reference",
            "user.attribute": "firstName",
            "friendly.name": "givenName"
          }
        },
        {
          "id": "f6a7b8c9-d0e1-2345-f012-345678901801",
          "name": "family-name",
          "protocol": "saml",
          "protocolMapper": "saml-user-attribute-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:2.5.4.4",
            "attribute.nameformat": "URI Reference",
            "user.attribute": "lastName",
            "friendly.name": "sn"
          }
        },
        {
          "id": "a7b8c9d0-e1f2-3456-0123-456789012801",
          "name": "email",
          "protocol": "saml",
          "protocolMapper": "saml-user-attribute-mapper",
          "consentRequired": false,
          "config": {
            "attribute.name": "urn:oid:0.9.2342.19200300.100.1.3",
            "attribute.nameformat": "URI Reference",
            "user.attribute": "email",
            "friendly.name": "mail"
          }
        }
      ]
    }
  ],
  "users": [
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123801",
      "username": "testuser",
      "email": "testuser@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Test",
      "lastName": "User",
      "attributes": {
        "eppn": ["testuser@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123901",
      "username": "loadtest01",
      "email": "loadtest01@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test01",
      "attributes": {
        "eppn": ["loadtest01@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123902",
      "username": "loadtest02",
      "email": "loadtest02@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test02",
      "attributes": {
        "eppn": ["loadtest02@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123903",
      "username": "loadtest03",
      "email": "loadtest03@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test03",
      "attributes": {
        "eppn": ["loadtest03@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123904",
      "username": "loadtest04",
      "email": "loadtest04@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test04",
      "attributes": {
        "eppn": ["loadtest04@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123905",
      "username": "loadtest05",
      "email": "loadtest05@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test05",
      "attributes": {
        "eppn": ["loadtest05@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123906",
      "username": "loadtest06",
      "email": "loadtest06@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test06",
      "attributes": {
        "eppn": ["loadtest06@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123907",
      "username": "loadtest07",
      "email": "loadtest07@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test07",
      "attributes": {
        "eppn": ["loadtest07@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123908",
      "username": "loadtest08",
      "email": "loadtest08@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test08",
      "attributes": {
        "eppn": ["loadtest08@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123909",
      "username": "loadtest09",
      "email": "loadtest09@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test09",
      "attributes": {
        "eppn": ["loadtest09@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123910",
      "username": "loadtest10",
      "email": "loadtest10@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test10",
      "attributes": {
        "eppn": ["loadtest10@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123911",
      "username": "loadtest11",
      "email": "loadtest11@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test11",
      "attributes": {
        "eppn": ["loadtest11@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123912",
      "username": "loadtest12",
      "email": "loadtest12@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test12",
      "attributes": {
        "eppn": ["loadtest12@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123913",
      "username": "loadtest13",
      "email": "loadtest13@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test13",
      "attributes": {
        "eppn": ["loadtest13@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123914",
      "username": "loadtest14",
      "email": "loadtest14@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test14",
      "attributes": {
        "eppn": ["loadtest14@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123915",
      "username": "loadtest15",
      "email": "loadtest15@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test15",
      "attributes": {
        "eppn": ["loadtest15@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123916",
      "username": "loadtest16",
      "email": "loadtest16@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test16",
      "attributes": {
        "eppn": ["loadtest16@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123917",
      "username": "loadtest17",
      "email": "loadtest17@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test17",
      "attributes": {
        "eppn": ["loadtest17@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123918",
      "username": "loadtest18",
      "email": "loadtest18@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test18",
      "attributes": {
        "eppn": ["loadtest18@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123919",
      "username": "loadtest19",
      "email": "loadtest19@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test19",
      "attributes": {
        "eppn": ["loadtest19@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    },
    {
      "id": "b8c9d0e1-f2a3-4567-1234-567890123920",
      "username": "loadtest20",
      "email": "loadtest20@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test20",
      "attributes": {
        "eppn": ["loadtest20@oakland.edu"],
        "enrollment_status": ["student"]
      },
      "credentials": [
        {
          "type": "password",
          "value": "loadtest-password",
          "temporary": false
        }
      ]
    }
  ]
}
