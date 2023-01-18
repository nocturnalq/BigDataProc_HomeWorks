FROM hadoop-base-image

LABEL maintainer="Leonid Filippov l.filippov2@edu.mirea.ru"

USER root

# Copy a public key
COPY --chown=bigdata:bigdata ./keys/id_rsa.pub .ssh/

# Copy the entrypoint script
COPY ./worker/entrypoint.sh /usr/local/bin/

RUN cat .ssh/id_rsa.pub >> .ssh/authorized_keys && \
    chmod 755 /usr/local/bin/entrypoint.sh 

USER bigdata

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]