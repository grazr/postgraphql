#!/bin/bash

if ! [ -z ${POSTGRAPHQL_GRAPHIQL_DISABLED+x} ]; then
    POSTGRAPHQL_GRAPHIQL_DISABLED="--disable-graphiql"
fi

postgraphql --host 0.0.0.0 --cors $POSTGRAPHQL_GRAPHIQL_DISABLED \
 --connection postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOSTNAME:$POSTGRES_PORT \
 --schema "$POSTGRAPHQL_SCHEMAS_MONITORED" \
 --jwt-secret "$JWT_SECRET" \
 --default-role $POSTGRES_USER \
 --token "$POSTGRAPHQL_JWT_TOKEN_TYPE" \
 --watch \
 1>/dev/null
