# getting base image Ubuntu
FROM ubuntu
# MAINTAINER najite <najites443@gmail.com>
RUN apt-get update
CMD ["echo", "Hello from my Second dcoker image!!"]

ADD https://get.aquasec.com/microscanner/
RUN chmode +x /microscanner
RUN /microscanner MWI3MTI1NDM4NTM2 [--continue-on-failure]