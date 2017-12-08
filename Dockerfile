FROM registry.access.redhat.com/rhel7/rhel

MAINTAINER Steve M

LABEL description="Attempt to install satellite"

RUN yum --disablerepo=* --enablerepo=rhel-7-server-rpms install yum-utils
    
RUN yum-config-manager --enable rhel-server-rhscl-7-rpms rhel-7-server-satellite-6.2-rpms

RUN yum-config-manager --enable rhel-7-server-satellite-6.2-rpms

RUN yum repolist

RUN yum -y update && \
    yum -y install satellite

RUN export FACTER_fqdn=`hostname -f` && satellite-installer --scenario satellite \
    --foreman-initial-organization "initial_organization_name" \
    --foreman-initial-location "initial_location_name" \
    --foreman-admin-username admin-username \
    --foreman-admin-password admin-password \
    --foreman-proxy-dns-managed=false \
    --foreman-proxy-dhcp-managed=false

CMD sleep 6000
