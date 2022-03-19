# syntax=docker/dockerfile:1
FROM msoap/shell2http
RUN apk add --update --no-cache alpine-sdk ncftp
WORKDIR /app
COPY swisseph .
RUN make
RUN ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/seas_18.se1 && \
    ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/semo_18.se1 && \
    ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/sepl_18.se1 && \
    ncftpget ftp://ftp.astro.ch/pub/swisseph/ephe/sefstars.txt
CMD ["/date", "date"]
EXPOSE 8080
