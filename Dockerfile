FROM svdt5kubreg01.safaricom.net/service-dev/tibco-bwce-baom:2.6.1
MAINTAINER OODINGA
ADD mavenTest/target/*.ear /
USER bwce
ENV TZ=Africa/Nairobi