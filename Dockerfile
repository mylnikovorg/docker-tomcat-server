
FROM mylnikovorg/docker-centos-mc

MAINTAINER Alex Mylnikov, alex@mylnikov.org

RUN yum -y install wget unzip tar gzip

#ADD rc.local /etc/rc.local

ADD scriptstart /

RUN mkdir /home/tmp

ADD apache-tomcat-7.0.55.zip /home/tmp/apache-tomcat-7.0.55.zip

ADD jre-8u20-linux-x64.tar.gz /home/tmp/jre-8u20-linux-x64.tar.gz

RUN chmod a+x /scriptstart

RUN cd /opt && unzip /home/tmp/apache-tomcat-7.0.55.zip 
RUN cd /opt && mkdir jre  && cp -r /home/tmp/jre-8u20-linux-x64.tar.gz/jre1.8.0_20/* ./jre





 
#RUN echo "tmpfs       /mnt/ramdisk tmpfs   nodev,nosuid,exec,nodiratime,size=300M   0 0" >> /etc/fstab 


CMD /scriptstart
