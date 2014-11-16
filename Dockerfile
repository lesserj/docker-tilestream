FROM centos:centos7

# Enable EPEL for Node.js
RUN     yum install -y epel-release
# Install Node.js and npm
RUN     yum install -y nodejs

EXPOSE 8080
