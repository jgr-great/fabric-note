```json
{
  "channel_group": {
    "groups": {
      "Application": {
        "groups": {
          "Org1MSP": {
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
                          "msp_identifier": "Org1MSP",
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
                          "msp_identifier": "Org1MSP",
                          "role": "ADMIN"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org1MSP",
                          "role": "PEER"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org1MSP",
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
                          "msp_identifier": "Org1MSP",
                          "role": "ADMIN"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org1MSP",
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
              "AnchorPeers": {
                "mod_policy": "Admins",
                "value": {
                  "anchor_peers": [
                    {
                      "host": "peer0.org1.example.com",
                      "port": 7051
                    }
                  ]
                },
                "version": "0"
              },
              "MSP": {
                "mod_policy": "Admins",
                "value": {
                  "config": {
                    "admins": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNLekNDQWRHZ0F3SUJBZ0lSQU4wL3VVWkZCdzF4TWxqdm1uTGg4L2d3Q2dZSUtvWkl6ajBFQXdJd2N6RUwKTUFrR0ExVUVCaE1DVlZNeEV6QVJCZ05WQkFnVENrTmhiR2xtYjNKdWFXRXhGakFVQmdOVkJBY1REVk5oYmlCRwpjbUZ1WTJselkyOHhHVEFYQmdOVkJBb1RFRzl5WnpFdVpYaGhiWEJzWlM1amIyMHhIREFhQmdOVkJBTVRFMk5oCkxtOXlaekV1WlhoaGJYQnNaUzVqYjIwd0hoY05NVGt4TWpFNU1USTBPREF3V2hjTk1qa3hNakUyTVRJME9EQXcKV2pCc01Rc3dDUVlEVlFRR0V3SlZVekVUTUJFR0ExVUVDQk1LUTJGc2FXWnZjbTVwWVRFV01CUUdBMVVFQnhNTgpVMkZ1SUVaeVlXNWphWE5qYnpFUE1BMEdBMVVFQ3hNR1kyeHBaVzUwTVI4d0hRWURWUVFEREJaQlpHMXBia0J2CmNtY3hMbVY0WVcxd2JHVXVZMjl0TUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJemowREFRY0RRZ0FFaDlCQndNLzEKYkpSOHZRSnRSNjZzeTdUTXQ5QzhTQTJJMHY4eENWZUpWeHlmT2p4YlRVUXFHTmdLMGx1VUZUc0xlSmNzUTMySQo2Tm9CaHVoeThKSktKS05OTUVzd0RnWURWUjBQQVFIL0JBUURBZ2VBTUF3R0ExVWRFd0VCL3dRQ01BQXdLd1lEClZSMGpCQ1F3SW9BZ2NwWWtOUXV0ZnRqV0lYbXg4dVk3MmtjRkdjTm9vaUFOdVlndVM1eDU2VFV3Q2dZSUtvWkkKemowRUF3SURTQUF3UlFJaEFKR1ZBbHlLZ3l2THQ4ck5kZG9iOE12VEQrdEFuZmlLQ1JjMmdMWCtYcG1yQWlBdApOSGJmRW0vbExDZUFDMmVNMkhiTHh2VjY5SDMvcHByWDc0Y0dpTEJwRWc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
                    ],
                    "crypto_config": {
                      "identity_identifier_hash_function": "SHA256",
                      "signature_hash_family": "SHA2"
                    },
                    "fabric_node_ous": {
                      "admin_ou_identifier": null,
                      "client_ou_identifier": {
                        "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRekNDQWVtZ0F3SUJBZ0lRRWNhTUk1QkZsU2w4a2FKOVVUeVYvREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTVM1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NUzVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3hMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jeExtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKNytRamZPbm9KL2NkeC9VczJLWW4vRGwwT3FQbkdnTUZjNVpRRTIxRDkwclN6eENCSENHai9HN3liUysrZ3dzawp1Ky9ERExFK3ZQdkM4bWt3eWVpNGFxTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnY3BZa05RdXRmdGpXSVhteDh1WTcKMmtjRkdjTm9vaUFOdVlndVM1eDU2VFV3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQU5GOWpoTG1ub3BkTU9ISApQaFdob2tKZ29QVnF5KzM3SUxNOTQvU3pqVmR4QWlBMHVnUzBsbCtOMit6SUdNbDZRZG8yMXJVVEU0ZXlBVW5zCm53NHJiNU91YXc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",
                        "organizational_unit_identifier": "client"
                      },
                      "enable": true,
                      "orderer_ou_identifier": null,
                      "peer_ou_identifier": {
                        "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRekNDQWVtZ0F3SUJBZ0lRRWNhTUk1QkZsU2w4a2FKOVVUeVYvREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTVM1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NUzVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3hMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jeExtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKNytRamZPbm9KL2NkeC9VczJLWW4vRGwwT3FQbkdnTUZjNVpRRTIxRDkwclN6eENCSENHai9HN3liUysrZ3dzawp1Ky9ERExFK3ZQdkM4bWt3eWVpNGFxTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnY3BZa05RdXRmdGpXSVhteDh1WTcKMmtjRkdjTm9vaUFOdVlndVM1eDU2VFV3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQU5GOWpoTG1ub3BkTU9ISApQaFdob2tKZ29QVnF5KzM3SUxNOTQvU3pqVmR4QWlBMHVnUzBsbCtOMit6SUdNbDZRZG8yMXJVVEU0ZXlBVW5zCm53NHJiNU91YXc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",
                        "organizational_unit_identifier": "peer"
                      }
                    },
                    "intermediate_certs": [],
                    "name": "Org1MSP",
                    "organizational_unit_identifiers": [],
                    "revocation_list": [],
                    "root_certs": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRekNDQWVtZ0F3SUJBZ0lRRWNhTUk1QkZsU2w4a2FKOVVUeVYvREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTVM1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NUzVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3hMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jeExtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKNytRamZPbm9KL2NkeC9VczJLWW4vRGwwT3FQbkdnTUZjNVpRRTIxRDkwclN6eENCSENHai9HN3liUysrZ3dzawp1Ky9ERExFK3ZQdkM4bWt3eWVpNGFxTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnY3BZa05RdXRmdGpXSVhteDh1WTcKMmtjRkdjTm9vaUFOdVlndVM1eDU2VFV3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQU5GOWpoTG1ub3BkTU9ISApQaFdob2tKZ29QVnF5KzM3SUxNOTQvU3pqVmR4QWlBMHVnUzBsbCtOMit6SUdNbDZRZG8yMXJVVEU0ZXlBVW5zCm53NHJiNU91YXc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
                    ],
                    "signing_identity": null,
                    "tls_intermediate_certs": [],
                    "tls_root_certs": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNTRENDQWUrZ0F3SUJBZ0lRQko0cVJ6K1JvVXRHSlUvVk9HN0RQVEFLQmdncWhrak9QUVFEQWpCMk1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTVM1bGVHRnRjR3hsTG1OdmJURWZNQjBHQTFVRUF4TVdkR3h6ClkyRXViM0puTVM1bGVHRnRjR3hsTG1OdmJUQWVGdzB4T1RFeU1Ua3hNalE0TURCYUZ3MHlPVEV5TVRZeE1qUTQKTURCYU1IWXhDekFKQmdOVkJBWVRBbFZUTVJNd0VRWURWUVFJRXdwRFlXeHBabTl5Ym1saE1SWXdGQVlEVlFRSApFdzFUWVc0Z1JuSmhibU5wYzJOdk1Sa3dGd1lEVlFRS0V4QnZjbWN4TG1WNFlXMXdiR1V1WTI5dE1SOHdIUVlEClZRUURFeFowYkhOallTNXZjbWN4TG1WNFlXMXdiR1V1WTI5dE1Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMEQKQVFjRFFnQUV4UFdrWmdsZTQ5bVBqWmJZTUIvaTJGdGhhVDBmRHY0R1FqVzJCWXFEVlhTM1lDYnVDREFNQ1BSSwpTcEdENVpYWGxBZVdBVkk0cGVQS0k2ajkvK2RUQjZOZk1GMHdEZ1lEVlIwUEFRSC9CQVFEQWdHbU1BOEdBMVVkCkpRUUlNQVlHQkZVZEpRQXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QXBCZ05WSFE0RUlnUWdyVHJDWVhmbm9tdE4KNmYzZFVJblVmTWxHS3J3bDBUREU5QVJJWVNxdmJMa3dDZ1lJS29aSXpqMEVBd0lEUndBd1JBSWdibmNmVFlzYQppSXVGZThjVFNLZWNmTGZFUkE2YVFIckRmY3ltc3p1NVpaWUNJQTN2RkdaODl6eXZ4VWpJSHk1Q2VJd3BVbjF6CnU1MHRWU1BSa3ZTS1lRRzEKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
                    ]
                  },
                  "type": 0
                },
                "version": "0"
              }
            },
            "version": "1"
          },
          "Org2MSP": {
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
                          "msp_identifier": "Org2MSP",
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
                          "msp_identifier": "Org2MSP",
                          "role": "ADMIN"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org2MSP",
                          "role": "PEER"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org2MSP",
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
                          "msp_identifier": "Org2MSP",
                          "role": "ADMIN"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org2MSP",
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
              "AnchorPeers": {
                "mod_policy": "Admins",
                "value": {
                  "anchor_peers": [
                    {
                      "host": "peer0.org2.example.com",
                      "port": 7051
                    }
                  ]
                },
                "version": "0"
              },
              "MSP": {
                "mod_policy": "Admins",
                "value": {
                  "config": {
                    "admins": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNLakNDQWRDZ0F3SUJBZ0lRWEFVTXByMkJKUGozNC9MMmtlYUhEakFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTWk1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NaTVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmEKTUd3eEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVE4d0RRWURWUVFMRXdaamJHbGxiblF4SHpBZEJnTlZCQU1NRmtGa2JXbHVRRzl5Clp6SXVaWGhoYlhCc1pTNWpiMjB3V1RBVEJnY3Foa2pPUFFJQkJnZ3Foa2pPUFFNQkJ3TkNBQVMrR2NvSHR3by8KL01zT05pMU94UGxHSXkvc2k5bVVLMGlyU2duY1pwcW1EQlZYMzRlNlZDM0tlWWppM2VsTVZUZmprZnZYYTljMApKMFh5NnoxbUJrQ0pvMDB3U3pBT0JnTlZIUThCQWY4RUJBTUNCNEF3REFZRFZSMFRBUUgvQkFJd0FEQXJCZ05WCkhTTUVKREFpZ0NEVnpPcklDdm50Ri9qM2c5S091SlY0THEwNjBmWStJOEp3RWdkMCtsRTFYVEFLQmdncWhrak8KUFFRREFnTklBREJGQWlFQXRIVDIyaFg5SXI5UXRiNTFYU0h1QWYrNERsZ25XUUZSZ3BYWDYxSWMvVW9DSUJiegpXZ255ZEhDdU85dDdPcndtKzdBWUpHVVJJQlErL2xQZDdqcUEyMTJSCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
                    ],
                    "crypto_config": {
                      "identity_identifier_hash_function": "SHA256",
                      "signature_hash_family": "SHA2"
                    },
                    "fabric_node_ous": {
                      "admin_ou_identifier": null,
                      "client_ou_identifier": {
                        "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRakNDQWVtZ0F3SUJBZ0lRY3QrbUZqcThvOERCZjZoRUxwWjhVekFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTWk1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NaTVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3lMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jeUxtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKU0FZd2crS0dIYm5LT3grT0p4cnBJMUxkaXJpeG5TSG8ybDlNTVJ2SzRjRW1nU0lrQUZUb1hqZUdUVDJiTkJ6Kwo5b0piNXNQaVM3NElycXdRb2NJdEdLTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnMWN6cXlBcjU3UmY0OTRQU2pyaVYKZUM2dE90SDJQaVBDY0JJSGRQcFJOVjB3Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnR0JPaXhRQU9iNjZtd3E0Ywp4RThsdWt0VzZkZVZQVzVhSFRVZTdpZ1V1dDhDSUdvMk43cU9rUmZmQ0N3NUVYRFcxM2FyRkdCbUV4aEU3UGpYCnBMcVpsek5VCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K",
                        "organizational_unit_identifier": "client"
                      },
                      "enable": true,
                      "orderer_ou_identifier": null,
                      "peer_ou_identifier": {
                        "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRakNDQWVtZ0F3SUJBZ0lRY3QrbUZqcThvOERCZjZoRUxwWjhVekFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTWk1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NaTVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3lMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jeUxtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKU0FZd2crS0dIYm5LT3grT0p4cnBJMUxkaXJpeG5TSG8ybDlNTVJ2SzRjRW1nU0lrQUZUb1hqZUdUVDJiTkJ6Kwo5b0piNXNQaVM3NElycXdRb2NJdEdLTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnMWN6cXlBcjU3UmY0OTRQU2pyaVYKZUM2dE90SDJQaVBDY0JJSGRQcFJOVjB3Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnR0JPaXhRQU9iNjZtd3E0Ywp4RThsdWt0VzZkZVZQVzVhSFRVZTdpZ1V1dDhDSUdvMk43cU9rUmZmQ0N3NUVYRFcxM2FyRkdCbUV4aEU3UGpYCnBMcVpsek5VCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K",
                        "organizational_unit_identifier": "peer"
                      }
                    },
                    "intermediate_certs": [],
                    "name": "Org2MSP",
                    "organizational_unit_identifiers": [],
                    "revocation_list": [],
                    "root_certs": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRakNDQWVtZ0F3SUJBZ0lRY3QrbUZqcThvOERCZjZoRUxwWjhVekFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTWk1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NaTVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3lMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jeUxtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKU0FZd2crS0dIYm5LT3grT0p4cnBJMUxkaXJpeG5TSG8ybDlNTVJ2SzRjRW1nU0lrQUZUb1hqZUdUVDJiTkJ6Kwo5b0piNXNQaVM3NElycXdRb2NJdEdLTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnMWN6cXlBcjU3UmY0OTRQU2pyaVYKZUM2dE90SDJQaVBDY0JJSGRQcFJOVjB3Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnR0JPaXhRQU9iNjZtd3E0Ywp4RThsdWt0VzZkZVZQVzVhSFRVZTdpZ1V1dDhDSUdvMk43cU9rUmZmQ0N3NUVYRFcxM2FyRkdCbUV4aEU3UGpYCnBMcVpsek5VCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
                    ],
                    "signing_identity": null,
                    "tls_intermediate_certs": [],
                    "tls_root_certs": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNTRENDQWUrZ0F3SUJBZ0lRR05DUGFydXFUVG9rbE5YajJuV2JQakFLQmdncWhrak9QUVFEQWpCMk1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTWk1bGVHRnRjR3hsTG1OdmJURWZNQjBHQTFVRUF4TVdkR3h6ClkyRXViM0puTWk1bGVHRnRjR3hsTG1OdmJUQWVGdzB4T1RFeU1Ua3hNalE0TURCYUZ3MHlPVEV5TVRZeE1qUTQKTURCYU1IWXhDekFKQmdOVkJBWVRBbFZUTVJNd0VRWURWUVFJRXdwRFlXeHBabTl5Ym1saE1SWXdGQVlEVlFRSApFdzFUWVc0Z1JuSmhibU5wYzJOdk1Sa3dGd1lEVlFRS0V4QnZjbWN5TG1WNFlXMXdiR1V1WTI5dE1SOHdIUVlEClZRUURFeFowYkhOallTNXZjbWN5TG1WNFlXMXdiR1V1WTI5dE1Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMEQKQVFjRFFnQUVEa1NqTzlBd2RMQVQxSm43OFl4dmppaG9TcE1GQm1qT2syVyticGwxRkh1YWZHQ2tYVmVQRTNGcApSZFJGZG9GcGI0bHM4b1FKbXlaaEpoQWt2MHdpOUtOZk1GMHdEZ1lEVlIwUEFRSC9CQVFEQWdHbU1BOEdBMVVkCkpRUUlNQVlHQkZVZEpRQXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QXBCZ05WSFE0RUlnUWd5RjZ3RUxZbTBzT1kKUloydTFuRUp2cEpsalhNZlNXUGdERDAyRk5iWkFuWXdDZ1lJS29aSXpqMEVBd0lEUndBd1JBSWdUd1QyQ1Fxdwo0VGE3YURZTlBKUGY0MCtWOTZlYVZ2K3hwbkZYclBuNyt6b0NJRzhXMEdwcm1lRnhnRFVmalpzNG81QldwOE0vCjFmdHJYYk5BRyt2WlZhZ00KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
                    ]
                  },
                  "type": 0
                },
                "version": "0"
              }
            },
            "version": "1"
          },
          "Org3MSP": {
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
                          "msp_identifier": "Org3MSP",
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
                          "msp_identifier": "Org3MSP",
                          "role": "ADMIN"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org3MSP",
                          "role": "PEER"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org3MSP",
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
                          "msp_identifier": "Org3MSP",
                          "role": "ADMIN"
                        },
                        "principal_classification": "ROLE"
                      },
                      {
                        "principal": {
                          "msp_identifier": "Org3MSP",
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
              "AnchorPeers": {
                "mod_policy": "Admins",
                "value": {
                  "anchor_peers": [
                    {
                      "host": "peer0.org3.example.com",
                      "port": 7051
                    }
                  ]
                },
                "version": "0"
              },
              "MSP": {
                "mod_policy": "Admins",
                "value": {
                  "config": {
                    "admins": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNLVENDQWRDZ0F3SUJBZ0lRQmdoNHppemZzU2RVdmdTMmE3Z2VhekFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTXk1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NeTVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmEKTUd3eEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVE4d0RRWURWUVFMRXdaamJHbGxiblF4SHpBZEJnTlZCQU1NRmtGa2JXbHVRRzl5Clp6TXVaWGhoYlhCc1pTNWpiMjB3V1RBVEJnY3Foa2pPUFFJQkJnZ3Foa2pPUFFNQkJ3TkNBQVQxMGpCVmhwVDYKdDk5a3gyYWZEZkR2YkVyeVdoOHFmSGxScWdxazRLWmxUZ0lhRHJ4SmkxSW90N0o0OUJEbFJqUWZHL1JwTWNBbQpBNmtJME9UVnV6Z09vMDB3U3pBT0JnTlZIUThCQWY4RUJBTUNCNEF3REFZRFZSMFRBUUgvQkFJd0FEQXJCZ05WCkhTTUVKREFpZ0NDb0Y2b1lWKy9jUzF3blBsWWVJT0tmL1pETmNONnp6eVF3c1NFM2FwWmZhekFLQmdncWhrak8KUFFRREFnTkhBREJFQWlCUUZScWRodkJQN0dBTnFmTzJuV3BDYnkxcEI1a1dGemxEV096Yit1RllFQUlnSk15NwpRbW1xU0loTlBaYnVzTTcrUldDWGtJOTJ2am01YW56SUE1NFVlQ3M9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
                    ],
                    "crypto_config": {
                      "identity_identifier_hash_function": "SHA256",
                      "signature_hash_family": "SHA2"
                    },
                    "fabric_node_ous": {
                      "admin_ou_identifier": null,
                      "client_ou_identifier": {
                        "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNSRENDQWVxZ0F3SUJBZ0lSQU1qZmtVdFFWMm80a3JXanJObTYweTB3Q2dZSUtvWkl6ajBFQXdJd2N6RUwKTUFrR0ExVUVCaE1DVlZNeEV6QVJCZ05WQkFnVENrTmhiR2xtYjNKdWFXRXhGakFVQmdOVkJBY1REVk5oYmlCRwpjbUZ1WTJselkyOHhHVEFYQmdOVkJBb1RFRzl5WnpNdVpYaGhiWEJzWlM1amIyMHhIREFhQmdOVkJBTVRFMk5oCkxtOXlaek11WlhoaGJYQnNaUzVqYjIwd0hoY05NVGt4TWpFNU1USTBPREF3V2hjTk1qa3hNakUyTVRJME9EQXcKV2pCek1Rc3dDUVlEVlFRR0V3SlZVekVUTUJFR0ExVUVDQk1LUTJGc2FXWnZjbTVwWVRFV01CUUdBMVVFQnhNTgpVMkZ1SUVaeVlXNWphWE5qYnpFWk1CY0dBMVVFQ2hNUWIzSm5NeTVsZUdGdGNHeGxMbU52YlRFY01Cb0dBMVVFCkF4TVRZMkV1YjNKbk15NWxlR0Z0Y0d4bExtTnZiVEJaTUJNR0J5cUdTTTQ5QWdFR0NDcUdTTTQ5QXdFSEEwSUEKQkt0TUpYS0Evc3BVSVFGVitINWt0TkptKzlsc1psclFaZUtYUmU0VjRvaDhBbUJ0aWtUc0M4RGxlYlVyazRiYwo0eHpIWnhFSk9XVVZKRDAzOGJ4d0pPQ2pYekJkTUE0R0ExVWREd0VCL3dRRUF3SUJwakFQQmdOVkhTVUVDREFHCkJnUlZIU1VBTUE4R0ExVWRFd0VCL3dRRk1BTUJBZjh3S1FZRFZSME9CQ0lFSUtnWHFoaFg3OXhMWENjK1ZoNGcKNHAvOWtNMXczclBQSkRDeElUZHFsbDlyTUFvR0NDcUdTTTQ5QkFNQ0EwZ0FNRVVDSVFEMUlYQTA1L2dpUlFZdwo2Yno3S1Z1Y05zSktBS1plTGx6bkYvS1hVS2JBcmdJZ2RaSkdOODI1YkcwakdpMGU0K3Z0aVBrcTdQemtsblRyCjM0M1BLTmI0UnZzPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",
                        "organizational_unit_identifier": "client"
                      },
                      "enable": true,
                      "orderer_ou_identifier": null,
                      "peer_ou_identifier": {
                        "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNSRENDQWVxZ0F3SUJBZ0lSQU1qZmtVdFFWMm80a3JXanJObTYweTB3Q2dZSUtvWkl6ajBFQXdJd2N6RUwKTUFrR0ExVUVCaE1DVlZNeEV6QVJCZ05WQkFnVENrTmhiR2xtYjNKdWFXRXhGakFVQmdOVkJBY1REVk5oYmlCRwpjbUZ1WTJselkyOHhHVEFYQmdOVkJBb1RFRzl5WnpNdVpYaGhiWEJzWlM1amIyMHhIREFhQmdOVkJBTVRFMk5oCkxtOXlaek11WlhoaGJYQnNaUzVqYjIwd0hoY05NVGt4TWpFNU1USTBPREF3V2hjTk1qa3hNakUyTVRJME9EQXcKV2pCek1Rc3dDUVlEVlFRR0V3SlZVekVUTUJFR0ExVUVDQk1LUTJGc2FXWnZjbTVwWVRFV01CUUdBMVVFQnhNTgpVMkZ1SUVaeVlXNWphWE5qYnpFWk1CY0dBMVVFQ2hNUWIzSm5NeTVsZUdGdGNHeGxMbU52YlRFY01Cb0dBMVVFCkF4TVRZMkV1YjNKbk15NWxlR0Z0Y0d4bExtTnZiVEJaTUJNR0J5cUdTTTQ5QWdFR0NDcUdTTTQ5QXdFSEEwSUEKQkt0TUpYS0Evc3BVSVFGVitINWt0TkptKzlsc1psclFaZUtYUmU0VjRvaDhBbUJ0aWtUc0M4RGxlYlVyazRiYwo0eHpIWnhFSk9XVVZKRDAzOGJ4d0pPQ2pYekJkTUE0R0ExVWREd0VCL3dRRUF3SUJwakFQQmdOVkhTVUVDREFHCkJnUlZIU1VBTUE4R0ExVWRFd0VCL3dRRk1BTUJBZjh3S1FZRFZSME9CQ0lFSUtnWHFoaFg3OXhMWENjK1ZoNGcKNHAvOWtNMXczclBQSkRDeElUZHFsbDlyTUFvR0NDcUdTTTQ5QkFNQ0EwZ0FNRVVDSVFEMUlYQTA1L2dpUlFZdwo2Yno3S1Z1Y05zSktBS1plTGx6bkYvS1hVS2JBcmdJZ2RaSkdOODI1YkcwakdpMGU0K3Z0aVBrcTdQemtsblRyCjM0M1BLTmI0UnZzPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",
                        "organizational_unit_identifier": "peer"
                      }
                    },
                    "intermediate_certs": [],
                    "name": "Org3MSP",
                    "organizational_unit_identifiers": [],
                    "revocation_list": [],
                    "root_certs": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNSRENDQWVxZ0F3SUJBZ0lSQU1qZmtVdFFWMm80a3JXanJObTYweTB3Q2dZSUtvWkl6ajBFQXdJd2N6RUwKTUFrR0ExVUVCaE1DVlZNeEV6QVJCZ05WQkFnVENrTmhiR2xtYjNKdWFXRXhGakFVQmdOVkJBY1REVk5oYmlCRwpjbUZ1WTJselkyOHhHVEFYQmdOVkJBb1RFRzl5WnpNdVpYaGhiWEJzWlM1amIyMHhIREFhQmdOVkJBTVRFMk5oCkxtOXlaek11WlhoaGJYQnNaUzVqYjIwd0hoY05NVGt4TWpFNU1USTBPREF3V2hjTk1qa3hNakUyTVRJME9EQXcKV2pCek1Rc3dDUVlEVlFRR0V3SlZVekVUTUJFR0ExVUVDQk1LUTJGc2FXWnZjbTVwWVRFV01CUUdBMVVFQnhNTgpVMkZ1SUVaeVlXNWphWE5qYnpFWk1CY0dBMVVFQ2hNUWIzSm5NeTVsZUdGdGNHeGxMbU52YlRFY01Cb0dBMVVFCkF4TVRZMkV1YjNKbk15NWxlR0Z0Y0d4bExtTnZiVEJaTUJNR0J5cUdTTTQ5QWdFR0NDcUdTTTQ5QXdFSEEwSUEKQkt0TUpYS0Evc3BVSVFGVitINWt0TkptKzlsc1psclFaZUtYUmU0VjRvaDhBbUJ0aWtUc0M4RGxlYlVyazRiYwo0eHpIWnhFSk9XVVZKRDAzOGJ4d0pPQ2pYekJkTUE0R0ExVWREd0VCL3dRRUF3SUJwakFQQmdOVkhTVUVDREFHCkJnUlZIU1VBTUE4R0ExVWRFd0VCL3dRRk1BTUJBZjh3S1FZRFZSME9CQ0lFSUtnWHFoaFg3OXhMWENjK1ZoNGcKNHAvOWtNMXczclBQSkRDeElUZHFsbDlyTUFvR0NDcUdTTTQ5QkFNQ0EwZ0FNRVVDSVFEMUlYQTA1L2dpUlFZdwo2Yno3S1Z1Y05zSktBS1plTGx6bkYvS1hVS2JBcmdJZ2RaSkdOODI1YkcwakdpMGU0K3Z0aVBrcTdQemtsblRyCjM0M1BLTmI0UnZzPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
                    ],
                    "signing_identity": null,
                    "tls_intermediate_certs": [],
                    "tls_root_certs": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNTVENDQWZDZ0F3SUJBZ0lSQU5QeDkrbnVVUlhWQ3FLY3JpZVZXY293Q2dZSUtvWkl6ajBFQXdJd2RqRUwKTUFrR0ExVUVCaE1DVlZNeEV6QVJCZ05WQkFnVENrTmhiR2xtYjNKdWFXRXhGakFVQmdOVkJBY1REVk5oYmlCRwpjbUZ1WTJselkyOHhHVEFYQmdOVkJBb1RFRzl5WnpNdVpYaGhiWEJzWlM1amIyMHhIekFkQmdOVkJBTVRGblJzCmMyTmhMbTl5WnpNdVpYaGhiWEJzWlM1amIyMHdIaGNOTVRreE1qRTVNVEkwT0RBd1doY05Namt4TWpFMk1USTAKT0RBd1dqQjJNUXN3Q1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRQpCeE1OVTJGdUlFWnlZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTXk1bGVHRnRjR3hsTG1OdmJURWZNQjBHCkExVUVBeE1XZEd4elkyRXViM0puTXk1bGVHRnRjR3hsTG1OdmJUQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDkKQXdFSEEwSUFCR0s1UGF5L1MxR2loQ1Q3bjhIdXMwWDRsSXBrSCtkUjJRRFdMMnpad2EyQnExVkxZUmhPLzU2ZQpQWDhieXN4cjV0WTZDa3V2RkNkUE9neDBNQXF1WXZLalh6QmRNQTRHQTFVZER3RUIvd1FFQXdJQnBqQVBCZ05WCkhTVUVDREFHQmdSVkhTVUFNQThHQTFVZEV3RUIvd1FGTUFNQkFmOHdLUVlEVlIwT0JDSUVJQWtrNkk0NldpQmUKQjE5eDIxVVMxL0N1aEpabzdnNEJ5NllaenB1UzB5ZExNQW9HQ0NxR1NNNDlCQU1DQTBjQU1FUUNJR0F1RWJEZQo5YXdlaXFkSU9XNXRnWWpzVDBITitoR2JxcytxU2tiekJKZWNBaUFyZEJVT3FmbVRBT0NvN1pRRFJGQTZJM0NmCjhoTlp0R1RmZ25ndFg1UU1pUT09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
                    ]
                  },
                  "type": 0
                },
                "version": "0"
              }
            },
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
                      "client_ou_identifier": {
                        "certificate": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRakNDQWVtZ0F3SUJBZ0lRZThDNmpvd1VvOENnNGQ3YVFLRDBKREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTkM1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5OQzVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEV5TXpBd09EVXlNREJhRncweU9URXlNamN3T0RVeU1EQmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtYzBMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jMExtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKU3owVGdBS2dwVEJlS2tSMWFhWXZHemQyaGp1WDRJZkRnZnQ2ZUhxMTdiRnhhcGRSc2c0STZlL1VWSEo1aVJwUgpVWjB5WFdTM3I0VmlWTmkyOUdDemZhTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnRUwzN0hhbUJldHBqd2lWdFJUaTAKL0Y0MmtHSEExZGhYMS9mQmZSSzgwamN3Q2dZSUtvWkl6ajBFQXdJRFJ3QXdSQUlnYStYVUFwVWEvWlhqZnJENwpNZ2ErdGxKdlZkV2RYMXlNMXppL0RQeC9TRDhDSUYxcWFMUUwyT1drNHpQWHdsUDYwbzhEYXpHOGdYWDJLbTVyCk9NaG1vTllXCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K",
                        "organizational_unit_identifier": "client"
                      },
                      "enable": true,
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
            "mod_policy": "Admins",
            "policy": {
              "type": 3,
              "value": {
                "rule": "MAJORITY",
                "sub_policy": "Admins"
              }
            },
            "version": "0"
          },
          "Readers": {
            "mod_policy": "Admins",
            "policy": {
              "type": 3,
              "value": {
                "rule": "ANY",
                "sub_policy": "Readers"
              }
            },
            "version": "0"
          },
          "Writers": {
            "mod_policy": "Admins",
            "policy": {
              "type": 3,
              "value": {
                "rule": "ANY",
                "sub_policy": "Writers"
              }
            },
            "version": "0"
          }
        },
        "values": {
          "Capabilities": {
            "mod_policy": "Admins",
            "value": {
              "capabilities": {
                "V1_3": {}
              }
            },
            "version": "0"
          }
        },
        "version": "1"
      },
      "Orderer": {
        "groups": {
          "OrdererOrg": {
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
                          "msp_identifier": "OrdererMSP",
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
                          "msp_identifier": "OrdererMSP",
                          "role": "MEMBER"
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
              "Writers": {
                "mod_policy": "Admins",
                "policy": {
                  "type": 1,
                  "value": {
                    "identities": [
                      {
                        "principal": {
                          "msp_identifier": "OrdererMSP",
                          "role": "MEMBER"
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
              }
            },
            "values": {
              "MSP": {
                "mod_policy": "Admins",
                "value": {
                  "config": {
                    "admins": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNDekNDQWJHZ0F3SUJBZ0lSQUxNRkFZdWpKUWZnTTN6SDQzL1FIdkl3Q2dZSUtvWkl6ajBFQXdJd2FURUwKTUFrR0ExVUVCaE1DVlZNeEV6QVJCZ05WQkFnVENrTmhiR2xtYjNKdWFXRXhGakFVQmdOVkJBY1REVk5oYmlCRwpjbUZ1WTJselkyOHhGREFTQmdOVkJBb1RDMlY0WVcxd2JHVXVZMjl0TVJjd0ZRWURWUVFERXc1allTNWxlR0Z0CmNHeGxMbU52YlRBZUZ3MHhPVEV5TVRreE1qUTRNREJhRncweU9URXlNVFl4TWpRNE1EQmFNRll4Q3pBSkJnTlYKQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVFlXNGdSbkpoYm1OcApjMk52TVJvd0dBWURWUVFEREJGQlpHMXBia0JsZUdGdGNHeGxMbU52YlRCWk1CTUdCeXFHU000OUFnRUdDQ3FHClNNNDlBd0VIQTBJQUJISzVkR2tSSzhqdCtFcUNtMkp0NW5jeWpYUFA1bzI3WHloVVFxSzBkRGJNSWlHSWowZGcKUm51YjBta3djVUI2eER5cmNjN2lZMStQYW05dzFkeWR3K1NqVFRCTE1BNEdBMVVkRHdFQi93UUVBd0lIZ0RBTQpCZ05WSFJNQkFmOEVBakFBTUNzR0ExVWRJd1FrTUNLQUlDMkNkNHQ3TVVlTnJUb0lPWGNSNENrR0dER2lLeDZmCjNrUTRDNHVXVi9DZk1Bb0dDQ3FHU000OUJBTUNBMGdBTUVVQ0lRQ0xtcGlkQ0NKeElTSFJ4NXVURG1JQTBJWGQKZm00WHcycnUyWW9PbHlzMWFnSWdQTEFxYjdNejIzNUt4L21RdnIvcG50cEpzYWV2VWJwbzZGdjRoVUJ6YldzPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
                    ],
                    "crypto_config": {
                      "identity_identifier_hash_function": "SHA256",
                      "signature_hash_family": "SHA2"
                    },
                    "fabric_node_ous": null,
                    "intermediate_certs": [],
                    "name": "OrdererMSP",
                    "organizational_unit_identifiers": [],
                    "revocation_list": [],
                    "root_certs": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNMakNDQWRXZ0F3SUJBZ0lRSStYdlZRNGdEc3EwaldMVzdxL3RlVEFLQmdncWhrak9QUVFEQWpCcE1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVVNQklHQTFVRUNoTUxaWGhoYlhCc1pTNWpiMjB4RnpBVkJnTlZCQU1URG1OaExtVjRZVzF3CmJHVXVZMjl0TUI0WERURTVNVEl4T1RFeU5EZ3dNRm9YRFRJNU1USXhOakV5TkRnd01Gb3dhVEVMTUFrR0ExVUUKQmhNQ1ZWTXhFekFSQmdOVkJBZ1RDa05oYkdsbWIzSnVhV0V4RmpBVUJnTlZCQWNURFZOaGJpQkdjbUZ1WTJsegpZMjh4RkRBU0JnTlZCQW9UQzJWNFlXMXdiR1V1WTI5dE1SY3dGUVlEVlFRREV3NWpZUzVsZUdGdGNHeGxMbU52CmJUQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDlBd0VIQTBJQUJHVE5PdW5GRVdEYnVsU2JhMWpPQjN2blV3WmQKMzM1NWlqcTNxcjViZWltRFZwSHpkMGxqS0VVWEJWV0taSGFzZnJkQ1lGUDljUXoxRjF5VnB2SVYxMVNqWHpCZApNQTRHQTFVZER3RUIvd1FFQXdJQnBqQVBCZ05WSFNVRUNEQUdCZ1JWSFNVQU1BOEdBMVVkRXdFQi93UUZNQU1CCkFmOHdLUVlEVlIwT0JDSUVJQzJDZDR0N01VZU5yVG9JT1hjUjRDa0dHREdpS3g2ZjNrUTRDNHVXVi9DZk1Bb0cKQ0NxR1NNNDlCQU1DQTBjQU1FUUNJR29vM0srZHR6RTdkRlo2Z1FLakc1VjVqKytMbFp4Z2cwVWVKVWV3b3ErTApBaUJVVEdrc2VUMm43VDdNM09YdzR6YThGK0dSU3A1Q05xcUYzaG1zUG9HNG5RPT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
                    ],
                    "signing_identity": null,
                    "tls_intermediate_certs": [],
                    "tls_root_certs": [
                      "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNOVENDQWR1Z0F3SUJBZ0lRVy9kYzAzODRGMW1Rc085d2NFUDZWakFLQmdncWhrak9QUVFEQWpCc01Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVVNQklHQTFVRUNoTUxaWGhoYlhCc1pTNWpiMjB4R2pBWUJnTlZCQU1URVhSc2MyTmhMbVY0CllXMXdiR1V1WTI5dE1CNFhEVEU1TVRJeE9URXlORGd3TUZvWERUSTVNVEl4TmpFeU5EZ3dNRm93YkRFTE1Ba0cKQTFVRUJoTUNWVk14RXpBUkJnTlZCQWdUQ2tOaGJHbG1iM0p1YVdFeEZqQVVCZ05WQkFjVERWTmhiaUJHY21GdQpZMmx6WTI4eEZEQVNCZ05WQkFvVEMyVjRZVzF3YkdVdVkyOXRNUm93R0FZRFZRUURFeEYwYkhOallTNWxlR0Z0CmNHeGxMbU52YlRCWk1CTUdCeXFHU000OUFnRUdDQ3FHU000OUF3RUhBMElBQlBTRGJ6YkFJZEY4WTdFWldPenoKdW1jdVpSbFJvVlN4MkdHc0dzVy8yOG9IaVV1bzkvSXE3YjIxdzdsL0U4YUUyMXJ0cG5vRjFLUUtzVkZ6UEd0awpwc3lqWHpCZE1BNEdBMVVkRHdFQi93UUVBd0lCcGpBUEJnTlZIU1VFQ0RBR0JnUlZIU1VBTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0tRWURWUjBPQkNJRUlKdFVTcTExb3h6VGdjbDh2VU52a3lYdm50NjNnWE5Ba0hDTS9xdHQKNGtMZU1Bb0dDQ3FHU000OUJBTUNBMGdBTUVVQ0lRRDFsWG9xb3BQRllOb1lyVmlYRzFRa2p0cDhvWWE4QUVCbQppeGVuL2hxN1lRSWdLdWJtTnpzL0RtRSt5Yk9jSEhLbzgyNWdQVEtLY2pFZ3JOZ2MvbjMxbWVZPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
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
            "mod_policy": "Admins",
            "policy": {
              "type": 3,
              "value": {
                "rule": "MAJORITY",
                "sub_policy": "Admins"
              }
            },
            "version": "0"
          },
          "BlockValidation": {
            "mod_policy": "Admins",
            "policy": {
              "type": 3,
              "value": {
                "rule": "ANY",
                "sub_policy": "Writers"
              }
            },
            "version": "0"
          },
          "Readers": {
            "mod_policy": "Admins",
            "policy": {
              "type": 3,
              "value": {
                "rule": "ANY",
                "sub_policy": "Readers"
              }
            },
            "version": "0"
          },
          "Writers": {
            "mod_policy": "Admins",
            "policy": {
              "type": 3,
              "value": {
                "rule": "ANY",
                "sub_policy": "Writers"
              }
            },
            "version": "0"
          }
        },
        "values": {
          "BatchSize": {
            "mod_policy": "Admins",
            "value": {
              "absolute_max_bytes": 102760448,
              "max_message_count": 10,
              "preferred_max_bytes": 524288
            },
            "version": "0"
          },
          "BatchTimeout": {
            "mod_policy": "Admins",
            "value": {
              "timeout": "2s"
            },
            "version": "0"
          },
          "Capabilities": {
            "mod_policy": "Admins",
            "value": {
              "capabilities": {
                "V1_1": {}
              }
            },
            "version": "0"
          },
          "ChannelRestrictions": {
            "mod_policy": "Admins",
            "value": null,
            "version": "0"
          },
          "ConsensusType": {
            "mod_policy": "Admins",
            "value": {
              "metadata": null,
              "state": "STATE_NORMAL",
              "type": "kafka"
            },
            "version": "0"
          },
          "KafkaBrokers": {
            "mod_policy": "Admins",
            "value": {
              "brokers": [
                "192.168.1.226:9092",
                "192.168.1.227:9092",
                "192.168.1.228:9092"
              ]
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
        "mod_policy": "Admins",
        "policy": {
          "type": 3,
          "value": {
            "rule": "MAJORITY",
            "sub_policy": "Admins"
          }
        },
        "version": "0"
      },
      "Readers": {
        "mod_policy": "Admins",
        "policy": {
          "type": 3,
          "value": {
            "rule": "ANY",
            "sub_policy": "Readers"
          }
        },
        "version": "0"
      },
      "Writers": {
        "mod_policy": "Admins",
        "policy": {
          "type": 3,
          "value": {
            "rule": "ANY",
            "sub_policy": "Writers"
          }
        },
        "version": "0"
      }
    },
    "values": {
      "BlockDataHashingStructure": {
        "mod_policy": "Admins",
        "value": {
          "width": 4294967295
        },
        "version": "0"
      },
      "Capabilities": {
        "mod_policy": "Admins",
        "value": {
          "capabilities": {
            "V1_3": {}
          }
        },
        "version": "0"
      },
      "Consortium": {
        "mod_policy": "Admins",
        "value": {
          "name": "SampleConsortium"
        },
        "version": "0"
      },
      "HashingAlgorithm": {
        "mod_policy": "Admins",
        "value": {
          "name": "SHA256"
        },
        "version": "0"
      },
      "OrdererAddresses": {
        "mod_policy": "/Channel/Orderer/Admins",
        "value": {
          "addresses": [
            "orderer0.example.com:7050",
            "orderer1.example.com:7050",
            "orderer2.example.com:7050"
          ]
        },
        "version": "0"
      }
    },
    "version": "0"
  },
  "sequence": "4"
}

```

