curl -X POST http://{{ hostvars.ist.host }}:3000/commands/register -H "Authorization:Basic YWRtaW46YWRtaW4=" --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"name": "dfsp1","shortName": "dfsp1","providerUrl": "http://{{ hostvars.dfsp1.host }}:8088/scheme/adapter/v1"}'

curl -X POST http://{{ hostvars.ist.host }}:3000/commands/register -H "Authorization:Basic YWRtaW46YWRtaW4=" --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{"name": "dfsp2","shortName": "dfsp2","providerUrl": "http://{{ hostvars.dfsp2.host }}:8088/scheme/adapter/v1"}'

curl -X POST http://{{ hostvars.ist.host }}:3004/accounts -H "Content-Type: application/json" -d '{"name":"dfsp1","password":"dfsp1"}'

curl -X POST http://{{ hostvars.ist.host }}:3004/accounts -H "Content-Type: application/json" -d '{"name":"dfsp2","password":"dfsp2"}'


# DFSP1 User Setup
curl -X POST http://{{ hostvars.dfsp1.host }}:8010/wallet -H "Authorization:Basic ZGZzcDEtdGVzdDpkZnNwMS10ZXN0" -H 'Content-Type: application/json' -d '{"firstName": "bob","lastName": "dylan","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "bob","accountName": "bob","password": "1234"}'

curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDEtdGVzdDpkZnNwMS10ZXN0" -X POST -d '{"firstName": "alice","lastName": "keys","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "alice","accountName": "alice","password": "1234"}' http://{{ hostvars.dfsp1.host }}:8010/wallet

curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDEtdGVzdDpkZnNwMS10ZXN0" -X POST -d '{"firstName": "admin","lastName": "admin","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "admin","accountName": "admin","password": "admin"}' http://{{ hostvars.dfsp1.host }}:8010/wallet

curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDEtdGVzdDpkZnNwMS10ZXN0" -X POST -d '{"firstName": "dfsp1-testconnector","lastName": "dfsp1-testconnector-last","dob": "10/12/1999","nationalId": "123456789","phoneNumber": "dfsp1-testconnector","accountName": "dfsp1-testconnector","password": "1234"}' http://{{ hostvars.dfsp1.host }}:8010/wallet

curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDEtdGVzdDpkZnNwMS10ZXN0" -X POST -d '{"firstName": "merchant","lastName": "merchant","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "merchant","accountName": "merchant","password": "1234"}' http://{{ hostvars.dfsp1.host }}:8010/wallet


# DFSP2 User Setup
curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDItdGVzdDpkZnNwMi10ZXN0" -X POST -d '{"firstName": "bob","lastName": "dylan","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "bob","accountName": "bob","password": "1234"}' http://{{ hostvars.dfsp2.host }}:8010/wallet

curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDItdGVzdDpkZnNwMi10ZXN0" -X POST -d '{"firstName": "alice","lastName": "keys","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "alice","accountName": "alice","password": "1234"}' http://{{ hostvars.dfsp2.host }}:8010/wallet

curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDItdGVzdDpkZnNwMi10ZXN0" -X POST -d '{"firstName": "admin","lastName": "admin","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "admin","accountName": "admin","password": "admin"}' http://{{ hostvars.dfsp2.host }}:8010/wallet

curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDItdGVzdDpkZnNwMi10ZXN0" -X POST -d '{"firstName": "dfsp2-testconnector","lastName": "dfsp2-testconnector-last","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "4567890123","accountName": "dfsp2-testconnector","password": "1234"}' http://{{ hostvars.dfsp2.host }}:8010/wallet

curl -H "Content-Type: application/json" -H "Authorization:Basic ZGZzcDItdGVzdDpkZnNwMi10ZXN0" -X POST -d '{"firstName": "merchant","lastName": "merchant","dob": "10/12/1999","nationalId": "123654789","phoneNumber": "merchant","accountName": "merchant","password": "1234"}' http://{{ hostvars.dfsp2.host }}:8010/wallet
