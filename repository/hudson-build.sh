#!/bin/bash -x

if [ ! -d "$M2" ]; then
    echo "Maven bin dir does not exist: $M2"
    exit 1
fi
PATH=$M2:$PATH

MSET="${WORKSPACE}/repository/settings.xml"
if [ ! -r $MSET ]
then
    echo "Missing maven settings"
    exit 1
fi

rm -rf ${WORKSPACE}/dot.m2
export CSS_M2_LOCAL=${WORKSPACE}/dot.m2/repository
OPTS="-s $MSET --batch-mode clean"

git clean -Xdf

cd ${WORKSPACE}

mvn $OPTS install -DskipTests=true || exit 1

cd ${WORKSPACE}/repository

mvn $OPTS p2:site || exit 1
