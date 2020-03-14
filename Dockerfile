ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# Setup base
ARG CONFIGURATOR_VERSION
RUN apk add --no-cache python3 git curl openssh \
  && pip3 install GitPython \
  && pip3 install pyotp \
  && curl -s -o /configurator.py https://raw.githubusercontent.com/danielperna84/hass-configurator/$CONFIGURATOR_VERSION/configurator.py
 
# Copy data
RUN curl -s -o /run.sh https://raw.githubusercontent.com/danielperna84/hassio-addons/$CONFIGURATOR_VERSION/hass-configurator/run.sh 
RUN chmod a+x /run.sh

# remove curl
RUN apk del curl

CMD ["/run.sh"]
