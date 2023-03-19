if [[ $(which docker) && $(docker --version) ]]; then
    echo "Docker is already installed"
  else
    echo "Docker not found... Installing Docker ..."
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update -y
    apt-cache policy docker-ce
    sudo apt install docker-ce -y
    sudo systemctl status docker
fi
if [[ $(which docker-compose) && $(docker-compose --version) ]]; then
    echo "Docker-compose is already installed"
  else
    echo "Docker-compose not found... Installing Docker-compose ..."
    sudo apt-get update -y
    sudo apt install curl -y
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
    sudo chmod +x /usr/bin/docker-compose
fi
if [[ $(which git) && $(git --version) ]]; then
    echo "Git is already installed"
  else
    echo "Installing Git"
    sudo apt update -y
    sudo apt install git -y
fi
