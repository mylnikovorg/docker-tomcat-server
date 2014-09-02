
FROM mylnikovorg/docker-centos-mc

MAINTAINER Alex Mylnikov, alex@mylnikov.org

RUN yum -y install wget unzip tar gzip curl

#ADD rc.local /etc/rc.local

ADD scriptstart /

RUN mkdir /home/tmp

ADD apache-tomcat-7.0.55.zip /home/tmp/apache-tomcat-7.0.55.zip

ADD jre-8u20-linux-x64.tar.gz /home/tmp/jre-8u20-linux-x64.tar.gz

RUN chmod a+x /scriptstart

RUN cd /opt && unzip /home/tmp/apache-tomcat-7.0.55.zip 
RUN cd /opt && mkdir jre  && cp -r /home/tmp/jre-8u20-linux-x64.tar.gz/jre1.8.0_20/* ./jre

RUN rm -rf /opt/apache-tomcat-7.0.55/webapps/*

#ENV _RUNJAVA /opt/jre/bin/java
ENV CATALINA_HOME /opt/apache-tomcat-7.0.55
ENV JAVA_HOME /opt/jre
ENV JRE_HOME /opt/jre

RUN mkdir /home/project

RUN rm /opt/apache-tomcat-7.0.55/conf/context.xml && rm /opt/apache-tomcat-7.0.55/conf/server.xml

ADD context.xml /opt/apache-tomcat-7.0.55/conf/context.xml
ADD server.xml /opt/apache-tomcat-7.0.55/conf/server.xml

RUN chmod -R 777 /opt/apache-tomcat-7.0.55/bin 

EXPOSE 80

CMD /scriptstart

