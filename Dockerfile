FROM mautic/mautic:latest

ENV DOCKER_MAUTIC_ROLE=mautic_web \
    PHP_INI_VALUE_DATE_TIMEZONE=UTC

# Conservar el lanzador original de Apache
RUN mv /usr/local/bin/apache2-foreground \
       /usr/local/bin/apache2-foreground-original

# Instalar el envoltorio que corrige los MPM al arrancar
COPY apache-start.sh /usr/local/bin/apache2-foreground

RUN sed -i 's/\r$//' /usr/local/bin/apache2-foreground \
    && chmod +x /usr/local/bin/apache2-foreground

# Se conserva el ENTRYPOINT oficial de Mautic