#!/bin/bash

test_directory_delete ()
{
    rm -Rf ${TMP}/*
}

test_directory_structure ()
{
    mkdir -p ${TMP}
    mkdir -p ${main}
    mkdir -p ${httpd}
    mkdir -p ${websites}
    mkdir -p ${ssl}
    mkdir -p ${source}
    mkdir -p ${dist}
    mkdir -p ${etc}
    touch ${hosts}
    touch ${LOG}
}

test_directory_delete
test_directory_structure
