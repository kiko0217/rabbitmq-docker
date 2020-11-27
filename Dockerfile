FROM rabbitmq:3.8.3-management
RUN bash -c "chmod 777 -R /etc/rabbitmq/"
RUN bash -c "chown -R rabbitmq:rabbitmq /etc/rabbitmq/"
RUN bash -c "chmod 777 -R /etc/rabbitmq/*"
#RUN bash -c "rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_management rabbitmq_federation_management rabbitmq_stomp"
#RUN rabbitmqctl add_user admin1 admin1
#RUN rabbitmqctl set_permissions -p / admin1 ".*" ".*" ".*"
#RUN rabbitmqctl set_user_tags admin1 management administrator
ENV RABBITMQ_USER admin1
ENV RABBITMQ_PASSWORD admin1
ENV RABBITMQ_PID_FILE /var/lib/rabbitmq/mnesia/rabbitmq
EXPOSE 15672
EXPOSE 5672
EXPOSE 1883
EXPOSE 15675
EXPOSE 15670
ADD init.sh /init.sh
RUN chmod +x /init.sh
CMD ["/init.sh"]
