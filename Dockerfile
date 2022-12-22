FROM ghcr.io/sscpac/statick:0.9.2

LABEL "name"="Statick Action"
LABEL "version"="0.1.0"
LABEL "repository"="https://github.com/sscpac/statick-action.git"
LABEL "homepage"="https://github.com/sscpac/statick-action"
LABEL "maintainer"="Thomas Denewiler <tdenewiler@gmail.com>"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
