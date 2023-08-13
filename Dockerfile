FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y

# change directory
RUN cd /var/www/html

# download webfiles
RUN wget https://cdn.discordapp.com/attachments/644029589932343296/1140404090678030346/RadioPlayer-main.zip

# unzip folder
RUN unzip RadioPlayer-main.zip

# copy files into html directory
RUN cp -r RadioPlayer-main/* /var/www/html/

# remove unwanted folder
RUN rm -rf RadioPlayer-main RadioPlayer-main.zip

# exposes port 80 on the container
EXPOSE 80

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
