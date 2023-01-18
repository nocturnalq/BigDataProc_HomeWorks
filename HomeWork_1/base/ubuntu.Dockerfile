FROM ubuntu:14.04

LABEL maintainer="Leonid Filippov l.filippov2@edu.mirea.ru Шитов Артём Валерьевич shitov.a.v2@edu.mirea.ru Агишевский Павел Дмитриевич agishevskij.p.d@edu.mirea.ru Стельмах Никита Евгеньевич stelmakh.n.e@edu.mirea.ru"


RUN apt-get update && apt-get install -y openssh-server software-properties-common nano && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt update && apt -y install openjdk-8-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# User home directory
ENV HOME /home/bigdata

# Create user
RUN useradd -m -p "$(openssl passwd -1 bigdata)" bigdata

# Set current dir
WORKDIR /home/bigdata

# Add sudo permission for hadoop user to start ssh service
RUN echo "bigdata ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh

# Change root to the bigdata user
USER bigdata

# Install Hadoop
RUN mkdir hadoop && \
    wget -q -P /home/bigdata/sources https://archive.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz && \
    tar xf sources/hadoop-3.1.2.tar.gz --directory hadoop --strip-components 1 && \
    rm -rf sources/hadoop-3.1.2.tar.gz

# Set Hadoop environment variables
ENV HDFS_NAMENODE_USER=bigdata
ENV HDFS_DATANODE_USER=bigdata 
ENV HDFS_SECONDARYNAMENODE_USER=bigdata 
ENV YARN_NODEMANAGER_USER=bigdata 
ENV YARN_RESOURCEMANAGER_USER=bigdata 
ENV HADOOP_HOME=$HOME/hadoop 
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop 
ENV PATH=$HADOOP_HOME/bin:$HADOOP_HOME:$PATH

# Copy hadoop configuration files
COPY --chown=bigdata:bigdata ["config/hdfs", "config/yarn", "config/mapreduce", "$HADOOP_CONF_DIR/"]

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]