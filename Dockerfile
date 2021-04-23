FROM ubuntu:18.04


COPY install-cloudformation-deployer.sh /install-cloudformation-deployer.sh
RUN chmod +x install-cloudformation-deployer.sh
RUN /install-cloudformation-deployer.sh


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh $cfnparams"]