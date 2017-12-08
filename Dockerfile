FROM registry.access.redhat.com/rhel7/rhel

MAINTAINER Your Name <youremail>

LABEL description="A basic Apache container on RHEL 7"

RUN yum -y update && \
    yum install -y httpd && \
    yum clean all

EXPOSE 80

CMD  ["httpd", "-D", "FOREGROUND"]
