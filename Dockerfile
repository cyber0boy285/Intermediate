# Use the official Ubuntu image from the Docker Hub
FROM ubuntu:latest

# Install updates, OpenSSH server, and Apache2
RUN apt-get update && \
    apt-get install -y openssh-server apache2 && \
    mkdir /var/run/sshd

# Change the root password to 'root' for testing purposes (optional but not secure)
RUN echo 'root:root' | chpasswd

# Allow root login via SSH (optional, not secure)
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose ports for SSH (22) and Apache (80)
EXPOSE 22 80

# Start both Apache2 and SSH services
CMD service apache2 start && /usr/sbin/sshd -D
