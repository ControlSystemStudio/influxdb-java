#!/bin/bash -x

if [ ! -d "$M2" ]; then
    echo "Maven bin dir does not exist: $M2"
    exit 1
fi
PATH=$M2:$PATH

if [ ! -d "$CSS_CI_DIR" ]; then
    echo "CSS_CI_DIR does not exist: $CSS_CI_DIR"
    exit 1
fi

MSET="${CSS_CI_DIR}/csstudio-ci/build-scripts/settings.xml"
if [ ! -r $MSET ]
then
    echo "Missing maven settings"
    exit 1
fi

export CSS_M2_LOCAL=${WORKSPACE}/dot.m2/repository
OPTS="-s $MSET"

git clean -Xdf

cd ${WORKSPACE}

mvn $OPTS || exit 1

cd ${WORKSPACE}/repository

mv $OPTS || exit 1
