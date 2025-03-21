FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update
RUN apt-get -y install openjdk-21-jdk wget

RUN wget 'https://course.ccs.neu.edu/cs3650/parent/MIPS-simulator/Mars4_4.jar'

RUN mkdir -p /etc/mars
RUN mv Mars4_4.jar /etc/mars/Mars.jar
RUN echo '#!/usr/bin/env bash\njava -jar /etc/mars/Mars.jar $@' > /usr/bin/Mars
RUN chmod +x /usr/bin/Mars

# USER ubuntu

