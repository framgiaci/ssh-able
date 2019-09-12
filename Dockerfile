FROM alpine

RUN apk --update add git openssh bash curl && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
    
RUN apk --update add python py-pip
RUN apk add --no-cache python3
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN export PATH=/root/.local/bin:$PATH
RUN pip install awsebcli --upgrade
RUN touch .bash_profile
RUN echo PATH=$PATH:~/bin >> ~/.bash_profile
COPY ssh_settup.sh /scripts/ssh_settup.sh
RUN ["chmod", "+x", "/scripts/ssh_settup.sh"]

WORKDIR /workdir