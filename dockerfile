FROM ubuntu:14.04
MAINTAINER Daniel Portella

ARG CONT_IMG_VER
ARG USER_ID=431
ARG GROUP_ID=433

LABEL version ${CONT_IMG_VER}
LABEL description Go process example for docker.

# everything from here to the user command is done under root.
RUN mkdir app
ADD golangweb-simple /app/
RUN chmod +x /app/golangweb-simple 

# some environment variables
ENV CONT_IMG_VER ${CONT_IMG_VER}
ENV ENVIRONMENT development
ENV BINDING :8080

# Define working directory.
WORKDIR /app

# Creating a group, user and adding the user to that group.
# allowing the user access to the app folder. 
RUN groupadd -r appgroup -g ${GROUP_ID} && \
    useradd -u ${USER_ID} -r -g appgroup -d /app -s /sbin/nologin -c "app user" app-user && \
    chown -R app-user:appgroup /app && \
    chmod -R 774 /app

# switching from root to the non-root user we just created
USER app-user

# exposing port 8080 for the go app
EXPOSE 8080

# Define default command.
ENTRYPOINT /app/golangweb-simple