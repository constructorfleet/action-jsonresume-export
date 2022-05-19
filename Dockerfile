FROM node:12

# do not require puppeteer download of Chronium;
# resume-cli uses puppeteer for PDF export, which we do not use.
ENV PUPPETEER_SKIP_DOWNLOAD=1

LABEL repository="https://github.com/constructorfleet/jsonresume-github-page"
LABEL homepage="https://github.com/constructorfleet/jsonresume-github-page"
LABEL maintainer="Teagan Glenn <that@teagantotally.rocks>"

RUN npm install -g resume-cli@3.0.3
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
