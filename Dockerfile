FROM swift:4.1

RUN apt-get update && apt-get install -y wget apt-transport-https software-properties-common python-software-properties && \
wget -q https://repo.vapor.codes/apt/keyring.gpg -O- | apt-key add - && \
echo "deb https://repo.vapor.codes/apt $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/vapor.list && \
apt-get update && \
apt-get install -y libmysqlclient20 libmysqlclient-dev cstack ctls openssl libssl-dev

ENV APP_ROOT=/vapor

WORKDIR ${APP_ROOT}

ADD . ${APP_ROOT}

RUN swift build -c release

ENV PATH "${APP_ROOT}/.build/release:${PATH}"

EXPOSE 8080

ENTRYPOINT ["Run"]
CMD ["serve", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]
