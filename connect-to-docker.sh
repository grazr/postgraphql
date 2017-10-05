#!/bin/bash

if ! [ -z ${POSTGRAPHQL_GRAPHIQL_DISABLED+x} ]; then
    POSTGRAPHQL_GRAPHIQL_DISABLED="--disable-graphiql"
fi

postgraphql --host 0.0.0.0 --cors $POSTGRAPHQL_GRAPHIQL_DISABLED \
 --connection postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOSTNAME:$POSTGRES_PORT \
 --watch \
 1>/dev/null
