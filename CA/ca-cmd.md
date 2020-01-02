



```shell
export FABRIC_CA_CLIENT_HOME=$HOME/fabric-ca/clients/admin

fabric-ca-client enroll -u http://admin:adminpw@localhost:7054

fabric-ca-client register --id.name peer5 --id.type peer --id.affiliation org1 --id.attrs hf.Revoker=true

export FABRIC_CA_CLIENT_HOME=$HOME/fabric-ca/clients/admin
fabric-ca-client enroll -u http://peer5:peer5pw@localhost:7054 -M $FABRIC_CA_CLIENT_HOME/msp
```

