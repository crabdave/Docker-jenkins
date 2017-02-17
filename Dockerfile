
# Pull base image  
FROM node:4

RUN npm install -g npm@3
RUN npm install -g cnpm
RUN npm install -g cnpm

MAINTAINER crabdave "calorie.david@gmail.com"  

# Usage: USER [UID]
USER root

# modify timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set the locale
RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen en_US.UTF-8

#modify Character set
# Ensure UTF-8 locale
#COPY locale /etc/default/locale
RUN locale-gen zh_CN.UTF-8 &&\
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8  
ENV LANG zh_CN.UTF-8  
ENV LANGUAGE zh_CN:zh  
ENV LC_ALL zh_CN.UTF-8  

#add jdk
ADD jdk-8u91-linux-x64.tar.gz /opt
#add maven
ADD apache-maven-3.3.3-bin.tar.gz /opt
#add maven conf
ADD settings.xml /opt/apache-maven-3.3.3/conf

#add jenkins
ADD jenkins.war /opt

ENV JAVA_HOME=/opt/jdk1.8.0_91
ENV PATH=$JAVA_HOME/bin:$PATH 
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar 
ENV MAVEN_HOME=/opt/apache-maven-3.3.3
ENV PATH=$MAVEN_HOME/bin:$PATH

ADD start.sh /opt
RUN chmod +x /opt/start.sh

ENTRYPOINT ["/opt/start.sh"]

