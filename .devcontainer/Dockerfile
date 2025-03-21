FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install openjdk-21-jdk wget

RUN wget 'https://course.ccs.neu.edu/cs3650/parent/MIPS-simulator/Mars4_4.jar'

RUN mkdir -p /etc/mars
RUN mv Mars4_4.jar /etc/mars/Mars.jar
RUN echo '#!/usr/bin/env bash\njava -jar /etc/mars/Mars.jar $@' > /usr/bin/Mars
RUN chmod +x /usr/bin/Mars
RUN Mars h && exit 1


# [Optional] Uncomment if you want to install an additional version
#  of node using nvm
# ARG EXTRA_NODE_VERSION=18
# RUN su node -c "source /usr/local/share/nvm/nvm.sh \
#    && nvm install ${EXTRA_NODE_VERSION}"

# COPY ./script-in-your-repo.sh /tmp/scripts/script-in-codespace.sh
# RUN apt-get update && bash /tmp/scripts/script-in-codespace.sh
