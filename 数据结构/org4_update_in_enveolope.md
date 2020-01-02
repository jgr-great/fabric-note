```json
{
  "payload": {
    "header": {
      "channel_header": {
        "channel_id": "mychannel",
        "type": 2
      }
    },
    "data": {
      "config_update": {
        "channel_id": "mychannel",
        "isolated_data": {},
        "read_set": {
          "groups": {
            "Application": {
              "groups": {
                "Org1MSP": {
                  "groups": {},
                  "mod_policy": "",
                  "policies": {},
                  "values": {},
                  "version": "1"
                },
                "Org2MSP": {
                  "groups": {},
                  "mod_policy": "",
                  "policies": {},
                  "values": {},
                  "version": "1"
                },
                "Org3MSP": {
                  "groups": {},
                  "mod_policy": "",
                  "policies": {},
                  "values": {},
                  "version": "1"
                }
              },
              "mod_policy": "",
              "policies": {
                "Admins": {
                  "mod_policy": "",
                  "policy": null,
                  "version": "0"
                },
                "Readers": {
                  "mod_policy": "",
                  "policy": null,
                  "version": "0"
                },
                "Writers": {
                  "mod_policy": "",
                  "policy": null,
                  "version": "0"
                }
              },
              "values": {
                "Capabilities": {
                  "mod_policy": "",
                  "value": null,
                  "version": "0"
                }
              },
              "version": "1"
            }
          },
          "mod_policy": "",
          "policies": {},
          "values": {},
          "version": "0"
        },
        "write_set": {
          "groups": {
            "Application": {
              "groups": {
                "Org1MSP": {
                  "groups": {},
                  "mod_policy": "",
                  "policies": {},
                  "values": {},
                  "version": "1"
                },
                "Org2MSP": {
                  "groups": {},
                  "mod_policy": "",
                  "policies": {},
                  "values": {},
                  "version": "1"
                },
                "Org3MSP": {
                  "groups": {},
                  "mod_policy": "",
                  "policies": {},
                  "values": {},
                  "version": "1"
                },
                "org4MSP": {
                  "groups": {},
                  "mod_policy": "Admins",
                  "policies": {
                    "Admins": {
                      "mod_policy": "Admins",
                      "policy": {
                        "type": 1,
                        "value": {
                          "identities": [
                            {
                              "principal": {
                                "msp_identifier": "Org4MSP",
                                "role": "ADMIN"
                              },
                              "principal_classification": "ROLE"
                            }
                          ],
                          "rule": {
                            "n_out_of": {
                              "n": 1,
                              "rules": [
                                {
                                  "signed_by": 0
                                }
                              ]
                            }
                          },
                          "version": 0
                        }
                      },
                      "version": "0"
                    },
                    "Readers": {
                      "mod_policy": "Admins",
                      "policy": {
                        "type": 1,
                        "value": {
                          "identities": [
                            {
                              "principal": {
                                "msp_identifier": "Org4MSP",
                                "role": "ADMIN"
                              },
                              "principal_classification": "ROLE"
                            },
                            {
                              "principal": {
                                "msp_identifier": "Org4MSP",
                                "role": "PEER"
                              },
                              "principal_classification": "ROLE"
                            },
                            {
                              "principal": {
                                "msp_identifier": "Org4MSP",
                                "role": "CLIENT"
                              },
                              "principal_classification": "ROLE"
                            }
                          ],
                          "rule": {
                            "n_out_of": {
                              "n": 1,
                              "rules": [
                                {
                                  "signed_by": 0
                                },
                                {
                                  "signed_by": 1
                                },
                                {
                                  "signed_by": 2
                                }
                              ]
                            }
                          },
                          "version": 0
                        }
                      },
                      "version": "0"
                    },
                    "Writers": {
                      "mod_policy": "Admins",
                      "policy": {
                        "type": 1,
                        "value": {
                          "identities": [
                            {
                              "principal": {
                                "msp_identifier": "Org4MSP",
                                "role": "ADMIN"
                              },
                              "principal_classification": "ROLE"
                            },
                            {
                              "principal": {
                                "msp_identifier": "Org4MSP",
                                "role": "CLIENT"
                              },
                              "principal_classification": "ROLE"
                            }
                          ],
                          "rule": {
                            "n_out_of": {
                              "n": 1,
                              "rules": [
                                {
                                  "signed_by": 0
                                },
                                {
                                  "signed_by": 1
                                }
                              ]
                            }
                          },
                          "version": 0
                        }
                      },
                      "version": "0"
                    }
                  },
                  "values": {
                    "MSP": {
                      "mod_policy": "Admins",
                      "value": {
                        "config": {
                          "admins": [
                            "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNLakNDQWRHZ0F3SUJBZ0lSQUo3ZGcydk5YNytBVWU2dnZWL2tlRWd3Q2dZSUtvWkl6ajBFQXdJd2N6RUwKTUFrR0ExVUVCaE1DVlZNeEV6QVJCZ05WQkFnVENrTmhiR2xtYjNKdWFXRXhGakFVQmdOVkJBY1REVk5oYmlCRwpjbUZ1WTJselkyOHhHVEFYQmdOVkJBb1RFRzl5WnpRdVpYaGhiWEJzWlM1amIyMHhIREFhQmdOVkJBTVRFMk5oCkxtOXlaelF1WlhoaGJYQnNaUzVqYjIwd0hoY05NVGt4TWpNd01EZzFNakF3V2hjTk1qa3hNakkzTURnMU1qQXcKV2pCc01Rc3dDUVlEVlFRR0V3SlZVekVUTUJFR0ExVUVDQk1LUTJGc2FXWnZjbTVwWVRFV01CUUdBMVVFQnhNTgpVMkZ1SUVaeVlXNWphWE5qYnpFUE1BMEdBMVVFQ3hNR1kyeHBaVzUwTVI4d0hRWURWUVFEREJaQlpHMXBia0J2CmNtYzBMbVY0WVcxd2JHVXVZMjl0TUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJemowREFRY0RRZ0FFbTFXM3RVbksKc1E0czVkWXlEcTdNR0pjeHNRUEhvTmRjNjlFbVVWOEFsa3I4QTZROVBVc3Z0TGpaMkRFVGRxZHloZUFsUjdCcwprTUY5ME9qdWl4QTdQYU5OTUVzd0RnWURWUjBQQVFIL0JBUURBZ2VBTUF3R0ExVWRFd0VCL3dRQ01BQXdLd1lEClZSMGpCQ1F3SW9BZ0VMMzdIYW1CZXRwandpVnRSVGkwL0Y0MmtHSEExZGhYMS9mQmZSSzgwamN3Q2dZSUtvWkkKemowRUF3SURSd0F3UkFJZ0VNMjVhNW5kOWVVMDRHREVBZTkyUlZhNnNPTFR5em00UUtMYmRsbHpRa2tDSUZERApMNWx0VzYwU24zTzMrV29TUHJPNEdUZzZ5SngzY1ZWVUZxMHJaWjNECi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
                          ],
                          "crypto_config": {
                            "identity_identifier_hash_function": "SHA256",
                            "signature_hash_family": "SHA2"
                          },
                          "fabric_node_ous": {
                            "admin_ou_identifier": null,
                            "client_ou_identifier": {
                              "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRakNDQWVtZ0F3SUJBZ0lRZThDNmpvd1VvOENnNGQ3YVFLRDBKREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTkM1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5OQzVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TXpBd09EVXlNREJhRncweU9URXlNamN3T0RVeU1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtYzBMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jMExtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKU3owVGdBS2dwVEJlS2tSMWFhWXZHemQyaGp1WDRJZkRnZnQ2ZUhxMTdiRnhhcGRSc2c0STZlL1VWSEo1aVJwUgpVWjB5WFdTM3I0VmlWTmkyOUdDemZhTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnRUwzN0hhbUJldHBqd2lWdFJUaTAKL0Y0MmtHSEExZGhYMS9mQmZSSzgwamN3Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnYStYVUFwVWEvWlhqZnJENwpNZ2ErdGxKdlZkV2RYMXlNMXppL0RQeC9TRDhDSUYxcWFMUUwyT1drNHpQWHdsUDYwbzhEYXpHOGdYWDJLbTVyCk9NaG1vTllXCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K",
                              "organizational_unit_identifier": "client"
                            },
                            "enable": true,
                            "orderer_ou_identifier": null,
                            "peer_ou_identifier": {
                              "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRakNDQWVtZ0F3SUJBZ0lRZThDNmpvd1VvOENnNGQ3YVFLRDBKREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTkM1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5OQzVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TXpBd09EVXlNREJhRncweU9URXlNamN3T0RVeU1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtYzBMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jMExtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKU3owVGdBS2dwVEJlS2tSMWFhWXZHemQyaGp1WDRJZkRnZnQ2ZUhxMTdiRnhhcGRSc2c0STZlL1VWSEo1aVJwUgpVWjB5WFdTM3I0VmlWTmkyOUdDemZhTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnRUwzN0hhbUJldHBqd2lWdFJUaTAKL0Y0MmtHSEExZGhYMS9mQmZSSzgwamN3Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnYStYVUFwVWEvWlhqZnJENwpNZ2ErdGxKdlZkV2RYMXlNMXppL0RQeC9TRDhDSUYxcWFMUUwyT1drNHpQWHdsUDYwbzhEYXpHOGdYWDJLbTVyCk9NaG1vTllXCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K",
                              "organizational_unit_identifier": "peer"
                            }
                          },
                          "intermediate_certs": [],
                          "name": "Org4MSP",
                          "organizational_unit_identifiers": [],
                          "revocation_list": [],
                          "root_certs": [
                            "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRakNDQWVtZ0F3SUJBZ0lRZThDNmpvd1VvOENnNGQ3YVFLRDBKREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTkM1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5OQzVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TXpBd09EVXlNREJhRncweU9URXlNamN3T0RVeU1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtYzBMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jMExtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKU3owVGdBS2dwVEJlS2tSMWFhWXZHemQyaGp1WDRJZkRnZnQ2ZUhxMTdiRnhhcGRSc2c0STZlL1VWSEo1aVJwUgpVWjB5WFdTM3I0VmlWTmkyOUdDemZhTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnRUwzN0hhbUJldHBqd2lWdFJUaTAKL0Y0MmtHSEExZGhYMS9mQmZSSzgwamN3Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnYStYVUFwVWEvWlhqZnJENwpNZ2ErdGxKdlZkV2RYMXlNMXppL0RQeC9TRDhDSUYxcWFMUUwyT1drNHpQWHdsUDYwbzhEYXpHOGdYWDJLbTVyCk9NaG1vTllXCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
                          ],
                          "signing_identity": null,
                          "tls_intermediate_certs": [],
                          "tls_root_certs": [
                            "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNTRENDQWUrZ0F3SUJBZ0lRZE90Z09NTUlEdzlKcUxHeE5JRzNGakFLQmdncWhrak9QUVFEQWpCMk1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTkM1bGVHRnRjR3hsTG1OdmJURWZNQjBHQTFVRUF4TVdkR3h6ClkyRXViM0puTkM1bGVHRnRjR3hsTG1OdmJUQWVGdzB4T1RFeU16QXdPRFV5TURCYUZ3MHlPVEV5TWpjd09EVXkKTURCYU1IWXhDekFKQmdOVkJBWVRBbFZUTVJNd0VRWURWUVFJRXdwRFlXeHBabTl5Ym1saE1SWXdGQVlEVlFRSApFdzFUWVc0Z1JuSmhibU5wYzJOdk1Sa3dGd1lEVlFRS0V4QnZjbWMwTG1WNFlXMXdiR1V1WTI5dE1SOHdIUVlEClZRUURFeFowYkhOallTNXZjbWMwTG1WNFlXMXdiR1V1WTI5dE1Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMEQKQVFjRFFnQUVmNFR3TGpaYUZsUUNZbjNpS2xzanlCbExLZS85SnVIMDJQZ0FYVVZLSmlXU0VSUXVnWXlOeStMdQo1K1luQXBkb09JenVJVVYrcHNlTmNBZVVKdVFaUmFOZk1GMHdEZ1lEVlIwUEFRSC9CQVFEQWdHbU1BOEdBMVVkCkpRUUlNQVlHQkZVZEpRQXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QXBCZ05WSFE0RUlnUWduKzVXa2pjUVZ4RDYKOXlrV00vaVZROVVVMXBLS3ZZblppY2xmUFdySFNFY3dDZ1lJS29aSXpqMEVBd0lEUndBd1JBSWdPSGQvNm16UwpPTzVnc2k0Z3IzQzlHZE1BT3RtOHZ6dllKZ3dnR3g0dzByZ0NJRGN2b1BBMytETmp1S21BTk1BWHFaVUxOL25WCldyTVVoNHJkL0RSWGlBUVQKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
                          ]
                        },
                        "type": 0
                      },
                      "version": "0"
                    }
                  },
                  "version": "0"
                }
              },
              "mod_policy": "Admins",
              "policies": {
                "Admins": {
                  "mod_policy": "",
                  "policy": null,
                  "version": "0"
                },
                "Readers": {
                  "mod_policy": "",
                  "policy": null,
                  "version": "0"
                },
                "Writers": {
                  "mod_policy": "",
                  "policy": null,
                  "version": "0"
                }
              },
              "values": {
                "Capabilities": {
                  "mod_policy": "",
                  "value": null,
                  "version": "0"
                }
              },
              "version": "2"
            }
          },
          "mod_policy": "",
          "policies": {},
          "values": {},
          "version": "0"
        }
      }
    }
  }
}
```

