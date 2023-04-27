# 1. apt-packages installation

## 1.1. Update the apt package index and install packages to allow apt to use a repository over HTTPS

```shell
sudo apt-get update
sudo apt-get install \
  ca-certificates \
  curl \
  gnupg \
  git \
  vim
```

## 1.2 Docker Installation

Reference on [Install Docker Engine on Debian](https://docs.docker.com/engine/install/debian/).

### 1.2.1. Add Docker’s official GPG key

```shell
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

### 1.2.3. Use the following command to set up the repository

```shell
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 1.2.4. Update the apt package index

```shell
sudo apt-get update
```

### 1.2.5. Install Docker Engine, containerd, and Docker Compose.

```shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## 1.3. Clean apt

```shell
sudo apt-get autoremove -yqq --purge \
  && sudo apt-get clean
```

# 2. Prep ro-dou directories and authentication to github and ghcr.io

## 2.1. Create user

```shell
sudo adduser ro-dou
# pasword: ro-dou123
sudo usermod -aG docker ro-dou
```

## 2.2. Create folders structure

```shell
  su - ro-dou && \
  mkdir /home/ro-dou/airflow-mnt && \
  mkdir /home/ro-dou/airflow-mnt/logs && \
  mkdir /home/ro-dou/airflow-mnt/pgdata
```

## 2.3. Git clone ro-dou-jobs

### 2.3.1. Create Github Personal Access Token with repo and read registry options enabled

Reference on [Creating a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

### 2.3.2 Change user for following commands

```shell
su - ro-dou
```

### 2.3.3. Login on ghcr.io

Step needed to `docker pull ghcr.io` on Github private package.

```shell
export GH_PAT=YOUR_TOKEN
export GH_USER=YOUR_GITHUB_USER

echo $GH_PAT | docker login ghcr.io -u $GH_USER --password-stdin
```

### 2.3.4. clone repo

```shell
# enables git commands to not prompt for login
git config --global credential.helper store

cd /home/ro-dou && \
  git clone https://$GH_USER:$GH_PAT@github.com/<your-user>/ro-dou-jobs.git
```

# 3. Enable services to run on VM startup and shutdown

## 3.1. Config ro-dou-startup.service to run on VM startup

Instructions at [sh/ro-dou-startup.service](sh/ro-dou-startup.service).

## 3.2. Config ro-dou-shutdown.service to run on VM shutdown

Instructions at [sh/ro-dou-shutdown.service](sh/ro-dou-shutdown.service).

# 5. Start Ro-Dou

```shell
/home/ro-dou/ro-dou-jobs/sh/ro-dou-startup.sh
```



