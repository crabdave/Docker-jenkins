

# Pull base image  
FROM centos:latest
  
MAINTAINER crabdave "calorie.david@gmail.com"  

# Usage: USER [UID]
USER root

# modify timezone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#modify Character set

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum install -y git

#add jdk
ADD jdk-8u91-linux-x64.tar.gz /opt
#add maven
ADD apache-maven-3.3.3-bin.tar.gz /opt
#add maven conf
#ADD settings.xml /opt/apache-maven-3.3.3/conf
#add jenkins
ADD jenkins.war /opt

ENV JAVA_HOME=/opt/jdk1.8.0_91
ENV PATH=$JAVA_HOME/bin:$PATH 
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar 
ENV MAVEN_HOME=/opt/apache-maven-3.3.3
ENV PATH=$MAVEN_HOME/bin:$PATH

#add start script
ADD start.sh /opt
RUN chmod +x /opt/start.sh

ENTRYPOINT ["/opt/start.sh"]
