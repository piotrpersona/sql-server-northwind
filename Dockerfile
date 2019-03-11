FROM mcr.microsoft.com/mssql/server:2017-latest

########################
# Developer tools      #
########################

# install zsh and oh-my-zsh
RUN apt update && apt install -y zsh wget git \
  && sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh-O -)" \
  && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions \
  && echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc \
  && echo "ZSH_THEME=af-magic" >> ~/.zshrc

# install dev tools
RUN apt install -y vim tmux

########################
# Configure SQL Server #
########################

ARG SQL_PASSWD="SQLServer2017"
ENV ACCEPT_EULA="Y"
ENV SA_PASSWORD="${SQL_PASSWD}"
ENV MSSQL_PID="Express"

ENV PATH=$PATH:/opt/mssql-tools/bin

WORKDIR "/root"

########################
# Setup Northwind Data #
########################

ARG NORTHWIND_SQL_GITHUB="https://raw.githubusercontent.com/Microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql"
ARG NORTHWIND_SQL="/usr/share/instnwnd.sql"
RUN wget "${NORTHWIND_SQL_GITHUB}" -O "${NORTHWIND_SQL}"
COPY entrypoint .

