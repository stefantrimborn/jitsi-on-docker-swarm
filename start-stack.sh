#!/bin/sh
export STACK="JITSI"
export DOMAIN="your.publicdomain.tld"
export LABEL="latest"

export ENABLE_AUTH=0
#export ENABLE_GUESTS=0
#export AUTH_TYPE=ldap
#export LDAP_AUTH_METHOD=bind
#export LDAP_URL=
#export LDAP_BINDDN=
#export LDAP_BASE=
#export LDAP_BINDPW=
#export LDAP_USE_TLS=0

export HTTP_PORT=8000
export HTTPS_PORT=8443
export TZ=Europe/Berlin
export PUBLIC_URL=https://your.publicdomain.tld
export DOCKER_HOST_ADDRESS=YOURNODEIP

export ETHERPAD_TITLE="Video Chat"
export ETHERPAD_DEFAULT_PAD_TEXT="Welcome to Web Chat!\n\n"
export ETHERPAD_SKIN_NAME="colibris"
export ETHERPAD_SKIN_VARIANTS="super-light-toolbar super-light-editor light-background full-width-editor"

export XMPP_DOMAIN=meet.jitsi
export XMPP_AUTH_DOMAIN=auth.meet.jitsi
export XMPP_SERVER=xmpp.meet.jitsi
export XMPP_BOSH_URL_BASE=http://xmpp.meet.jitsi:5280
export XMPP_MUC_DOMAIN=muc.meet.jitsi
export XMPP_INTERNAL_MUC_DOMAIN=internal-muc.meet.jitsi
export XMPP_GUEST_DOMAIN=guest.meet.jitsi
export XMPP_CROSS_DOMAIN=true
export XMPP_MODULES=
export XMPP_MUC_MODULES=
export XMPP_INTERNAL_MUC_MODULES=
export XMPP_RECORDER_DOMAIN=recorder.meet.jitsi

export JICOFO_COMPONENT_SECRET=CHANGEME
export JICOFO_AUTH_USER=focus
export JICOFO_AUTH_PASSWORD=CHANGEME

export JVB_BREWERY_MUC=jvbbrewery
export JVB_AUTH_USER=jvb
export JVB_AUTH_PASSWORD=CHANGEME
export JVB_STUN_SERVERS=stun.l.google.com:19302,stun1.l.google.com:19302,stun2.l.google.com:19302
export JVB_PORT=10000
export JVB_TCP_HARVESTER_DISABLED=true
export JVB_TCP_PORT=4443
export JVB_TCP_MAPPED_PORT=4443

export JIGASI_XMPP_USER=jigasi
export JIGASI_XMPP_PASSWORD=CHANGEME
export JIGASI_BREWERY_MUC=jigasibrewery
export JIGASI_PORT_MIN=20000
export JIGASI_PORT_MAX=20050

export JIBRI_RECORDER_USER=recorder
export JIBRI_RECORDING_DIR=/config/recordings
export JIBRI_XMPP_USER=jibri
export JIBRI_XMPP_PASSWORD=CHANGEME
export JIBRI_BREWERY_MUC=jibribrewery
export JIBRI_PENDING_TIMEOUT=90
export JIBRI_STRIP_DOMAIN_JID=muc
export JIBRI_LOGS_DIR=/config/logs


start() { 
  docker stack deploy -c $STACK-compose.yaml $STACK
}

stop() {
    docker stack rm $STACK
}

case $1 in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 (start|stop|restart)"
    exit 127
    ;;
esac
