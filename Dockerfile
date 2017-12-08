FROM registry.access.redhat.com/rhel7/rhel

MAINTAINER Steve M

LABEL description="Attempt to install satellite"

RUN subscription-manager repos --disable "*" && \
    subscription-manager repos --enable=rhel-7-server-rpms \
    --enable=rhel-server-rhscl-7-rpms \
    --enable=rhel-7-server-satellite-6.2-rpms

RUN yum -y update && \
    yum clean all && \
    yum install satellite

EXPOSE 80

CMD  ["httpd", "-D", "FOREGROUND"]
