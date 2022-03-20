# syntax=docker/dockerfile:1
FROM msoap/shell2http
RUN apk add --update --no-cache make g++ ncftp
WORKDIR /app
ARG swe=swe_unix_src_2.10.02.tar.gz
COPY $swe .
RUN if [[ ! -f $swe ]]; then ncftpget ftp://ftp.astro.ch/pub/swisseph/${swe}; fi
RUN tar -xf ${swe} && rm ${swe}
RUN cd src && make && mv swetest .. && cd .. && rm -rf doc src
COPY libs.txt .
# RUN while read line; do ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/$line; done < libs.txt 
COPY auto-dl.sh .
CMD ["-form", "/sweph", "/app/auto-dl.sh $v_cmd"]
EXPOSE 8080
