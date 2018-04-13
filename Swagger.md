## Local L1P Instance Information

| Property | DFSP1 | DFSP2 |
| ----     | ----- | ----- |
| Instance Name | integrate-dfsp1 | integrate-dfsp2 |
| Instance ID |  |  |
| Address | [http://10.0.15.11:8020](http://10.0.15.11:8020) | [http://10.0.15.12:8020](http://10.0.15.12:8020) |

### SSH

#### Mac  
* for dfsp1 - `vagrant ssh dfsp1`
* for dfsp2 - `vagrant ssh dfsp2`


#### Windows
 Install a native ssh client and ssh as above or
* for dfsp1 - `vagrant powershell dfsp1`
* for dfsp2 - `vagrant powershell dfsp2`



## API Info

### DFSP - Software Group

| Service | Port | DFSP1 URL | DFSP2 URL |
| ------- | -----| --------- | --------- |
| dfsp-ledger | 8014 | [http://10.0.15.11:8014/ledger](http://10.0.15.11:8014/documentation) | [http://10.0.15.12:8014/ledger](http://10.0.15.12:8014/documentation)  |
| dfsp-invoices | 8010 | [http://10.0.15.11:8010](http://10.0.15.11:8010/documentation) | [http://10.0.15.12:8010](http://10.0.15.12:8010/documentation)  |


### Mule Proxy  - Modusbox

| Service | Port | DFSP1 URL | DFSP2 URL |
| ------- | -----| --------- | --------- |
| interop-directory-gateway | 8088 |  [http://10.0.15.11:8088/directory/v1](http://10.0.15.11:8088/directory/v1/open-api/) | [http://10.0.15.12:8088/directory/v1](http://10.0.15.12:8088/directory/v1/open-api/) |
| interop-spsp-client-proxy | 8088 |  [http://10.0.15.11:8088/spsp/client/v1](http://10.0.15.11:8088/spsp/client/v1/open-api) | [http://10.0.15.12:8088/spsp/client/v1](http://10.0.15.12:8088/spsp/client/v1/open-api) |
| interop-ledger-adapter | 8088 |  [http://10.0.15.11:8088/ledger](http://10.0.15.11:8088/ilp/ledger/v1/open-api) | [http://10.0.15.12:8088/ledger](http://10.0.15.12:8088/ilp/ledger/v1/open-api) |
| interop-spsp-backend | 8088 |  [http://10.0.15.11:8088/spsp/backend/v1](http://10.0.15.11:8088/spsp/backend/v1/open-api) | [http://10.0.15.12:8088/spsp/backend/v1](http://10.0.15.12:8088/spsp/backend/v1/open-api) |

### ILP - Ripple

| Service | Port | DFSP1 URL | DFSP2 URL |
| ------- | -----| --------- | --------- |
| ilp-spsp-client-rest | 3042 |           |           |
| ilp-spsp-server | 3043 |           |           |
| ilp-connector | 3044 | [http://10.0.15.11:3044/v1](http://10.0.15.11:3044/v1) | [http://10.0.15.12:3044/v1](http://10.0.15.12:3044/v1) |

### SWITCH - Dwolla

| Service | Port | URL |
| ------- | -----| ----|
| central-ledger |  | [http://10.0.15.13:3002/](http://10.0.15.13:3002/documentation)|
| central-directory |  | [ http://10.0.15.13:3000/]( http://10.0.15.13:3000/documentation) |
| end-user-registry |  |  [http://10.0.15.13:3001/](http://10.0.15.13:3001/documentation)|


## Test Users
### DFSP1    
* bob    http://10.0.15.11:3043/v1/receivers/88925537
* alice    http://10.0.15.11:3043/v1/receivers/54200545
* merchant    http://10.0.15.11:3043/v1/receivers/31909641
* dfsp1-testconnector    http://10.0.15.11:3043/v1/receivers/91959846

### DFSP2    
* bob    http://10.0.15.12:3043/v1/receivers/97181061
* alice    http://10.0.15.12:3043/v1/receivers/52602716
* merchant    http://10.0.15.12:3043/v1/receivers/63858707
* dfsp2-testconnector    http://10.0.15.12:3043/v1/receivers/76838531

## Start/Stop scripts

#### Mule (executed from the dfsp vm)
* run `sudo docker ps -a` then find the container id for the mule container.  Execute `sudo docker stop <container id>`
* run `sudo docker ps -a` then find the container id for the mule container.  Execute `sudo docker start <container id>`

#### DFSP
* <TO BE FILLED>

#### ILP/SPSP
* <TO BE FILLED>

#### SWITCH
* <TO BE FILLED>


