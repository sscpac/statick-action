FROM ubuntu:20.04

LABEL "name"="Statick"
LABEL "version"="0.0"
LABEL "repository"="https://github.com/sscpac/statick-action.git"
LABEL "homepage"="https://github.com/sscpac/statick-action"
LABEL "maintainer"="Thomas Denewiler <tdenewiler@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cccc \
    chktex \
    clang \
    clang-6.0 \
    clang-10 \
    clang-format \
    clang-format-6.0 \
    clang-format-10 \
    clang-tidy \
    clang-tidy-6.0 \
    clang-tidy-10 \
    cmake \
    cppcheck \
    curl \
    file \
    findbugs \
    flawfinder \
    git \
    lacheck \
    libomp-dev \
    libpcre3-dev \
    libperl-critic-perl \
    libxml2 \
    libxml2-utils \
    maven \
    pylint \
    python3-pip \
    python3-pylint-django \
    python3-yaml \
    python3-yapsy \
    shellcheck \
    uncrustify \
    wget
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade \
    bandit \
    black \
    cmakelint \
    cpplint \
    docformatter \
    flake8 \
    flake8-blind-except \
    flake8-builtins \
    flake8-class-newline \
    flake8-comprehensions \
    flake8-docstrings \
    flake8-import-order \
    flake8-quotes \
    flawfinder \
    isort \
    lizard \
    mypy \
    pycodestyle \
    pydocstyle \
    pyflakes \
    pylint \
    setuptools \
    statick \
    statick-md \
    statick-tex \
    statick-tooling \
    statick-web \
    tox \
    tox-gh-actions \
    types-PyYAML \
    wheel \
    xmltodict \
    yamllint \
    yapsy

# Statick npm tools.
# Have to install newer version from non-apt source due to SSL library compatibility issues.
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get update && apt-get install -y --no-install-recommends nodejs
RUN apt-get clean
RUN npm config set prefix -g /usr
RUN npm install -g \
    dockerfilelint \
    dockerfile_lint \
    prettier \
    eslint@5.16.0 \
    eslint-plugin-html \
    eslint-plugin-prettier \
    eslint-config-prettier \
    htmllint-cli \
    markdownlint-cli@0.21.0 \
    npm-groovy-lint \
    stylelint \
    stylelint-config-standard

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
