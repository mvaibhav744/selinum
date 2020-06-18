FROM alpine:3.7
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.7/main" >> /etc/apk/repositories && \
        echo "http://dl-4.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories
RUN apk update && \
        apk add python py-pip curl unzip libexif udev chromium=61.0.3163.100-r0 chromium-chromedriver=61.0.3163.100-r0 xvfb && \
        pip install selenium && \
        pip install pyvirtualdisplay
RUN apk add  unzip
RUN adduser -S unix
USER unix
#COPY ./chromedriver /root/
#RUN chmod 777 /root/chromedriver
COPY ./script.py /tmp/script.py
#RUN chmod +x /tmp/script.py
#RUN chmod +x /root/chromedriver

#RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
#RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# set display port to avoid crash
ENV DISPLAY=:0
CMD python /tmp/script.py  "accenture"                         
