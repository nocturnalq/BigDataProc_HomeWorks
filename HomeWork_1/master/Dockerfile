FROM hadoop-base-image

LABEL maintainer="Leonid Filippov l.filippov2@edu.mirea.ru Шитов Артём Валерьевич shitov.a.v2@edu.mirea.ru Агишевский Павел Дмитриевич agishevskij.p.d@edu.mirea.ru Стельмах Никита Евгеньевич stelmakh.n.e@edu.mirea.ru"

USER root

# Copy a private key
COPY --chown=bigdata:bigdata ./keys/id_rsa .ssh/

# Copy the entrypoint script
COPY ./master/entrypoint.sh /usr/local/bin/

RUN chmod 400 .ssh/id_rsa && \
    chmod 755 /usr/local/bin/entrypoint.sh 

USER bigdata

# Format Namenode
RUN hdfs namenode -format -force

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]