# syntax=docker/dockerfile:1
FROM msoap/shell2http
RUN apk add --update --no-cache alpine-sdk ncftp
WORKDIR /app
ARG swe=swe_unix_src_2.10.02.tar.gz
RUN ncftpget ftp://ftp.astro.ch/pub/swisseph/${swe} && \
    tar -xf ${swe} && rm ${swe}
RUN cd src && make && mv swetest .. && cd .. && rm -rf doc src
RUN ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/seas_18.se1 && \
    ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/semo_18.se1 && \
    ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/sepl_18.se1 && \
    ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/sefstars.txt
CMD ["-form", "/sweph", "/app/swetest $v_cmd"]
EXPOSE 8080
