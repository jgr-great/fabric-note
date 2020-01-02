```yaml
version: '2'


services:
    tlsca.org1.example.com:
        container_name: tlsca.org1.example.com
        image: hyperledger/fabric-ca
        environment:
            - FABRIC_CA_HOME=/etc/hyperledger/fabric-ca-server
            - FABRIC_CA_SERVER_CA_NAME=tlsca.org1.example.com
            - FABRIC_CA_SERVER_TLS_ENABLED=false
            - FABRIC_CA_SERVER_TLS_CERTFILE=/etc/hyperledger/fabric-ca-server-config/tlsca.org1.example.com-cert.pem
            - FABRIC_CA_SERVER_TLS_KEYFILE=/etc/hyperledger/fabric-ca-server-config/${CA_PKEY}
            - FABRIC_CA_SERVER_CA_CERTFILE=/etc/hyperledger/fabric-ca-server-config/tlsca.org1.example.com-cert.pem
            - FABRIC_CA_SERVER_CA_KEYFILE=/etc/hyperledger/fabric-ca-server-config/${CA_PKEY}
        ports:
            - "7054:7054"
        command: sh -c 'fabric-ca-server start --ca.certfile /etc/hyperledger/fabric-ca-server-config/ca.org1.example.com-cert.pem --ca.keyfile /etc/hyperledger/fabric-ca-server-config/${CA_PKEY} -b admin:adminpw -d'
        volumes:
            - ./crypto-config/peerOrganizations/org1.example.com/tlsca/:/etc/hyperledger/fabric-ca-server-config
        networks:
            default:
                aliases:
                    - tlsca.org1.example.com
        extra_hosts:
            - "tlsca.org1.example.com:192.168.1.226"
```

