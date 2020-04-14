FROM prestosql/presto:latest

COPY ./default/etc/ /usr/lib/presto/etc/

EXPOSE 8080
USER presto:presto
ENV LANG en_US.UTF-8
CMD ["/usr/lib/presto/bin/run-presto"]