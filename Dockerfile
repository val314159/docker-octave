FROM ubuntu

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get install -y xterm
RUN apt-get install -y openssh-server
RUN apt-get install -y telnet
RUN apt-get install -y nginx
RUN apt-get install -y python-dev python-gevent python-pip python-virtualenv

#RUN apt-get install -y octave

RUN apt-get install -y python-software-properties
RUN apt-get install -y x11-apps

RUN apt-get install -y software-properties-common
RUN apt-get install -y python3-software-properties

RUN apt-add-repository ppa:octave/stable
RUN apt-get -y update
RUN apt-get -y install octave

RUN apt-get -y install man emacs locate

RUN updatedb

RUN apt-get -y install firefox

RUN mkdir /var/run/sshd

RUN useradd -ms /bin/bash -p valval  -G sudo val
RUN useradd -ms /bin/bash -p visitor guest

RUN echo val:valval | chpasswd
RUN echo guest:visitor | chpasswd

RUN mkdir /home/val/.ssh
RUN chown val:val /home/val/.ssh
RUN chmod 700 /home/val/.ssh

COPY ./start.sh /root/
RUN chmod +x /root/start.sh

COPY ./val.pub /home/val/.ssh/authorized_keys
RUN chown val:val /home/val/.ssh/authorized_keys
RUN chmod 600  /home/val/.ssh/authorized_keys

EXPOSE 22 80 8080 443 4443 8000 8888 1234 2222

VOLUME /home/val/ml
