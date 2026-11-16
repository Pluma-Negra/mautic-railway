#!/bin/bash
set -Eeuo pipefail

echo "[apache-start] Configurando MPM prefork..."

# Eliminar las activaciones de los MPM incompatibles con mod_php
rm -f \
    /etc/apache2/mods-enabled/mpm_event.load \
    /etc/apache2/mods-enabled/mpm_event.conf \
    /etc/apache2/mods-enabled/mpm_worker.load \
    /etc/apache2/mods-enabled/mpm_worker.conf

a2enmod mpm_prefork

echo "[apache-start] Validando configuración..."
apache2ctl -t

echo "[apache-start] MPM cargado:"
apache2ctl -M | grep mpm

exec /usr/local/bin/apache2-foreground-original "$@"