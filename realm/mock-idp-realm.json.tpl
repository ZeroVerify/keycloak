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
    },
    {
      "id": "c9d0e1f2-a3b4-4567-1234-567890100021",
      "username": "loadtest21",
      "email": "loadtest21@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test21",
      "attributes": {
        "eppn": ["loadtest21@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100022",
      "username": "loadtest22",
      "email": "loadtest22@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test22",
      "attributes": {
        "eppn": ["loadtest22@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100023",
      "username": "loadtest23",
      "email": "loadtest23@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test23",
      "attributes": {
        "eppn": ["loadtest23@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100024",
      "username": "loadtest24",
      "email": "loadtest24@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test24",
      "attributes": {
        "eppn": ["loadtest24@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100025",
      "username": "loadtest25",
      "email": "loadtest25@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test25",
      "attributes": {
        "eppn": ["loadtest25@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100026",
      "username": "loadtest26",
      "email": "loadtest26@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test26",
      "attributes": {
        "eppn": ["loadtest26@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100027",
      "username": "loadtest27",
      "email": "loadtest27@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test27",
      "attributes": {
        "eppn": ["loadtest27@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100028",
      "username": "loadtest28",
      "email": "loadtest28@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test28",
      "attributes": {
        "eppn": ["loadtest28@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100029",
      "username": "loadtest29",
      "email": "loadtest29@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test29",
      "attributes": {
        "eppn": ["loadtest29@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100030",
      "username": "loadtest30",
      "email": "loadtest30@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test30",
      "attributes": {
        "eppn": ["loadtest30@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100031",
      "username": "loadtest31",
      "email": "loadtest31@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test31",
      "attributes": {
        "eppn": ["loadtest31@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100032",
      "username": "loadtest32",
      "email": "loadtest32@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test32",
      "attributes": {
        "eppn": ["loadtest32@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100033",
      "username": "loadtest33",
      "email": "loadtest33@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test33",
      "attributes": {
        "eppn": ["loadtest33@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100034",
      "username": "loadtest34",
      "email": "loadtest34@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test34",
      "attributes": {
        "eppn": ["loadtest34@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100035",
      "username": "loadtest35",
      "email": "loadtest35@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test35",
      "attributes": {
        "eppn": ["loadtest35@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100036",
      "username": "loadtest36",
      "email": "loadtest36@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test36",
      "attributes": {
        "eppn": ["loadtest36@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100037",
      "username": "loadtest37",
      "email": "loadtest37@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test37",
      "attributes": {
        "eppn": ["loadtest37@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100038",
      "username": "loadtest38",
      "email": "loadtest38@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test38",
      "attributes": {
        "eppn": ["loadtest38@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100039",
      "username": "loadtest39",
      "email": "loadtest39@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test39",
      "attributes": {
        "eppn": ["loadtest39@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100040",
      "username": "loadtest40",
      "email": "loadtest40@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test40",
      "attributes": {
        "eppn": ["loadtest40@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100041",
      "username": "loadtest41",
      "email": "loadtest41@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test41",
      "attributes": {
        "eppn": ["loadtest41@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100042",
      "username": "loadtest42",
      "email": "loadtest42@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test42",
      "attributes": {
        "eppn": ["loadtest42@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100043",
      "username": "loadtest43",
      "email": "loadtest43@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test43",
      "attributes": {
        "eppn": ["loadtest43@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100044",
      "username": "loadtest44",
      "email": "loadtest44@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test44",
      "attributes": {
        "eppn": ["loadtest44@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100045",
      "username": "loadtest45",
      "email": "loadtest45@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test45",
      "attributes": {
        "eppn": ["loadtest45@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100046",
      "username": "loadtest46",
      "email": "loadtest46@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test46",
      "attributes": {
        "eppn": ["loadtest46@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100047",
      "username": "loadtest47",
      "email": "loadtest47@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test47",
      "attributes": {
        "eppn": ["loadtest47@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100048",
      "username": "loadtest48",
      "email": "loadtest48@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test48",
      "attributes": {
        "eppn": ["loadtest48@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100049",
      "username": "loadtest49",
      "email": "loadtest49@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test49",
      "attributes": {
        "eppn": ["loadtest49@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100050",
      "username": "loadtest50",
      "email": "loadtest50@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test50",
      "attributes": {
        "eppn": ["loadtest50@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100051",
      "username": "loadtest51",
      "email": "loadtest51@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test51",
      "attributes": {
        "eppn": ["loadtest51@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100052",
      "username": "loadtest52",
      "email": "loadtest52@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test52",
      "attributes": {
        "eppn": ["loadtest52@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100053",
      "username": "loadtest53",
      "email": "loadtest53@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test53",
      "attributes": {
        "eppn": ["loadtest53@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100054",
      "username": "loadtest54",
      "email": "loadtest54@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test54",
      "attributes": {
        "eppn": ["loadtest54@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100055",
      "username": "loadtest55",
      "email": "loadtest55@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test55",
      "attributes": {
        "eppn": ["loadtest55@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100056",
      "username": "loadtest56",
      "email": "loadtest56@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test56",
      "attributes": {
        "eppn": ["loadtest56@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100057",
      "username": "loadtest57",
      "email": "loadtest57@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test57",
      "attributes": {
        "eppn": ["loadtest57@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100058",
      "username": "loadtest58",
      "email": "loadtest58@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test58",
      "attributes": {
        "eppn": ["loadtest58@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100059",
      "username": "loadtest59",
      "email": "loadtest59@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test59",
      "attributes": {
        "eppn": ["loadtest59@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100060",
      "username": "loadtest60",
      "email": "loadtest60@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test60",
      "attributes": {
        "eppn": ["loadtest60@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100061",
      "username": "loadtest61",
      "email": "loadtest61@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test61",
      "attributes": {
        "eppn": ["loadtest61@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100062",
      "username": "loadtest62",
      "email": "loadtest62@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test62",
      "attributes": {
        "eppn": ["loadtest62@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100063",
      "username": "loadtest63",
      "email": "loadtest63@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test63",
      "attributes": {
        "eppn": ["loadtest63@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100064",
      "username": "loadtest64",
      "email": "loadtest64@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test64",
      "attributes": {
        "eppn": ["loadtest64@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100065",
      "username": "loadtest65",
      "email": "loadtest65@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test65",
      "attributes": {
        "eppn": ["loadtest65@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100066",
      "username": "loadtest66",
      "email": "loadtest66@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test66",
      "attributes": {
        "eppn": ["loadtest66@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100067",
      "username": "loadtest67",
      "email": "loadtest67@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test67",
      "attributes": {
        "eppn": ["loadtest67@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100068",
      "username": "loadtest68",
      "email": "loadtest68@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test68",
      "attributes": {
        "eppn": ["loadtest68@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100069",
      "username": "loadtest69",
      "email": "loadtest69@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test69",
      "attributes": {
        "eppn": ["loadtest69@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100070",
      "username": "loadtest70",
      "email": "loadtest70@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test70",
      "attributes": {
        "eppn": ["loadtest70@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100071",
      "username": "loadtest71",
      "email": "loadtest71@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test71",
      "attributes": {
        "eppn": ["loadtest71@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100072",
      "username": "loadtest72",
      "email": "loadtest72@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test72",
      "attributes": {
        "eppn": ["loadtest72@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100073",
      "username": "loadtest73",
      "email": "loadtest73@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test73",
      "attributes": {
        "eppn": ["loadtest73@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100074",
      "username": "loadtest74",
      "email": "loadtest74@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test74",
      "attributes": {
        "eppn": ["loadtest74@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100075",
      "username": "loadtest75",
      "email": "loadtest75@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test75",
      "attributes": {
        "eppn": ["loadtest75@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100076",
      "username": "loadtest76",
      "email": "loadtest76@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test76",
      "attributes": {
        "eppn": ["loadtest76@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100077",
      "username": "loadtest77",
      "email": "loadtest77@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test77",
      "attributes": {
        "eppn": ["loadtest77@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100078",
      "username": "loadtest78",
      "email": "loadtest78@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test78",
      "attributes": {
        "eppn": ["loadtest78@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100079",
      "username": "loadtest79",
      "email": "loadtest79@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test79",
      "attributes": {
        "eppn": ["loadtest79@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100080",
      "username": "loadtest80",
      "email": "loadtest80@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test80",
      "attributes": {
        "eppn": ["loadtest80@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100081",
      "username": "loadtest81",
      "email": "loadtest81@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test81",
      "attributes": {
        "eppn": ["loadtest81@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100082",
      "username": "loadtest82",
      "email": "loadtest82@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test82",
      "attributes": {
        "eppn": ["loadtest82@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100083",
      "username": "loadtest83",
      "email": "loadtest83@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test83",
      "attributes": {
        "eppn": ["loadtest83@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100084",
      "username": "loadtest84",
      "email": "loadtest84@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test84",
      "attributes": {
        "eppn": ["loadtest84@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100085",
      "username": "loadtest85",
      "email": "loadtest85@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test85",
      "attributes": {
        "eppn": ["loadtest85@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100086",
      "username": "loadtest86",
      "email": "loadtest86@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test86",
      "attributes": {
        "eppn": ["loadtest86@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100087",
      "username": "loadtest87",
      "email": "loadtest87@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test87",
      "attributes": {
        "eppn": ["loadtest87@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100088",
      "username": "loadtest88",
      "email": "loadtest88@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test88",
      "attributes": {
        "eppn": ["loadtest88@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100089",
      "username": "loadtest89",
      "email": "loadtest89@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test89",
      "attributes": {
        "eppn": ["loadtest89@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100090",
      "username": "loadtest90",
      "email": "loadtest90@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test90",
      "attributes": {
        "eppn": ["loadtest90@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100091",
      "username": "loadtest91",
      "email": "loadtest91@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test91",
      "attributes": {
        "eppn": ["loadtest91@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100092",
      "username": "loadtest92",
      "email": "loadtest92@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test92",
      "attributes": {
        "eppn": ["loadtest92@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100093",
      "username": "loadtest93",
      "email": "loadtest93@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test93",
      "attributes": {
        "eppn": ["loadtest93@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100094",
      "username": "loadtest94",
      "email": "loadtest94@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test94",
      "attributes": {
        "eppn": ["loadtest94@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100095",
      "username": "loadtest95",
      "email": "loadtest95@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test95",
      "attributes": {
        "eppn": ["loadtest95@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100096",
      "username": "loadtest96",
      "email": "loadtest96@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test96",
      "attributes": {
        "eppn": ["loadtest96@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100097",
      "username": "loadtest97",
      "email": "loadtest97@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test97",
      "attributes": {
        "eppn": ["loadtest97@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100098",
      "username": "loadtest98",
      "email": "loadtest98@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test98",
      "attributes": {
        "eppn": ["loadtest98@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100099",
      "username": "loadtest99",
      "email": "loadtest99@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test99",
      "attributes": {
        "eppn": ["loadtest99@oakland.edu"],
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
      "id": "c9d0e1f2-a3b4-4567-1234-567890100100",
      "username": "loadtest100",
      "email": "loadtest100@oakland.edu",
      "emailVerified": true,
      "enabled": true,
      "firstName": "Load",
      "lastName": "Test100",
      "attributes": {
        "eppn": ["loadtest100@oakland.edu"],
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
