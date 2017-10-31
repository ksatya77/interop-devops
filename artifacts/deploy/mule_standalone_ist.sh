#!/usr/bin/env bash

export MULE_VERSION=3.8.1 MULE_HOME=/opt/mule JAVA_VERSION=8 MAX_JVM_MEMORY=2048 MULE_ENV=`hostname`-vagrant MULE_LIB=/opt/mule/lib HTTP_CONN_PORT_1=8081 HTTP_CONN_PORT_2=8088 HTTP_CONN_PORT_3=9081 HTTP_CONN_PORT_4=9082 DFSP_APP_VERSION=0.4.20 ILP_LEDGER_VERSION=0.1.3 SPSP_CLIENTPROXY_VERSION=0.4.11 SPSP_BACKEND_SERVICES_VERSION=0.1.11 INTEROP_DOMAIN_VERSION=0.1.23
export JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-oracle
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

add-apt-repository -y ppa:openjdk-r/ppa && \
apt-get update -y && \
apt-get install -y --no-install-recommends software-properties-common && \
apt-get install -y --no-install-recommends openjdk-${JAVA_VERSION}-jre
#add-apt-repository ppa:webupd8team/java && \
#apt-get update -y && \
#apt-get install -y --no-install-recommends oracle-java${JAVA_VERSION}-installer
    
if [ "${MULE_VERSION}" != "3.8.1" ] && [ "${MULE_VERSION}" != "3.8.0" ] && [ "${MULE_VERSION}" != "3.7.0" ] && [ "${MULE_VERSION}" != "3.6.1" ] && [ "${MULE_VERSION}" != "3.6.0" ]; then echo "-----   Unsupported version: ${MULE_VERSION}   -----" && return 1; fi

if [ "${MULE_VERSION}" = "3.8.1" ]; then cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/${MULE_VERSION}/mule-standalone-${MULE_VERSION}.tar.gz && echo "db079c0fc01c534d443277cfe96ab252 mule-standalone-${MULE_VERSION}.tar.gz" | md5sum -c ; fi
if [ "${MULE_VERSION}" = "3.8.0" ]; then cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/${MULE_VERSION}/mule-standalone-${MULE_VERSION}.tar.gz && echo "d9279b3f0373587715613341a16483f3 mule-standalone-${MULE_VERSION}.tar.gz" | md5sum -c ; fi
if [ "${MULE_VERSION}" = "3.7.0" ]; then cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/${MULE_VERSION}/mule-standalone-${MULE_VERSION}.tar.gz && echo "6814d3dffb5d8f308101ebb3f4e3224a mule-standalone-${MULE_VERSION}.tar.gz" | md5sum -c ; fi
if [ "${MULE_VERSION}" = "3.6.1" ]; then cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/${MULE_VERSION}/mule-standalone-${MULE_VERSION}.tar.gz && echo "3a018c579ae2cd172569c8f8cf3a44b8 mule-standalone-${MULE_VERSION}.tar.gz" | md5sum -c ; fi
if [ "${MULE_VERSION}" = "3.6.0" ]; then cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/${MULE_VERSION}/mule-standalone-${MULE_VERSION}.tar.gz && echo "e475eca6f954280f08e6a3f52893360c mule-standalone-${MULE_VERSION}.tar.gz" | md5sum -c ; fi

cd /opt && tar xvzf ~/mule-standalone-${MULE_VERSION}.tar.gz && rm ~/mule-standalone-${MULE_VERSION}.tar.gz && ln -s /opt/mule-standalone-${MULE_VERSION} /opt/mule

cp ~/mule-l1p.properties /opt/mule/conf
cp ~/adapter-mapping.properties /opt/mule/conf
cp ~/mule_artifacts/conf_ist/wrapper.conf /opt/mule/conf
#cp ~/mule_artifacts/lib/grizzly-http-servlet-2.3.24.jar /opt/mule/lib/user

cp ~/deploy/mb_mule /etc/init.d/mb_mule
chmod +x /etc/init.d/mb_mule

update-rc.d mb_mule defaults

service mb_mule start

