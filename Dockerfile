FROM node:alpine
LABEL maintainer="Jacob Mason <jacob@jacobmason.net>"
LABEL description="A GraphQL API created by reflection over a PostgreSQL schmea https://github.com/postgraphql/postgraphql"

# alpine linux standard doesn't include bash, and postgraphql scripts have #! bash
RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN mkdir -p /postgraphql
WORKDIR /postgraphql

COPY . /postgraphql

RUN npm install
RUN scripts/build
RUN npm pack
RUN npm install -g postgraphql-*.tgz

RUN rm -rf /postgraphql
EXPOSE 5000
COPY connect-to-docker.sh /connect-to-docker.sh
ENTRYPOINT "/connect-to-docker.sh"
