FROM centos
ENV CONTAINER_HOME=/var/www
RUN cd /etc/yum.repos.d/ && sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install -y python36-devel mysql-devel gcc

ADD . $CONTAINER_HOME
WORKDIR $CONTAINER_HOME
RUN pip3 install -r $CONTAINER_HOME/requirements.txt
CMD ["gunicorn","--bind","0.0.0.0:8000","--workers","3","wsgi"]
