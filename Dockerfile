# Use the official Ubuntu image from the Docker Hub
FROM ubuntu:latest

# Install updates and OpenSSH server
RUN apt-get update && apt-get install -y openssh-server

# Create the SSH directory and set up the configuration
RUN mkdir /var/run/sshd

# Change the root password to 'root' for testing purposes (optional but not secure)
RUN echo 'root:root' | chpasswd

# Allow root login via SSH (optional, not secure)
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Start the SSH service
CMD ["/usr/sbin/sshd", "-D"]
