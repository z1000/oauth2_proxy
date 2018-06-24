FROM debian:stable-slim
MAINTAINER Andrew Huynh <a5thuynh@gmail.com>

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2017-10-24
ENV OAUTH2_PROXY_VERSION 2.2

# Checkout bitly's latest google-auth-proxy code from Github
ADD oauth2_proxy ./bin/

# Install CA certificates
RUN apt-get update -y && apt-get install -y ca-certificates

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
ENTRYPOINT [ "./bin/oauth2_proxy" ]
CMD [ "--upstream=http://0.0.0.0:8080/", "--http-address=0.0.0.0:4180" ]
