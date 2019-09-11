## About The Project

**Contribution to the community to easy the network testing process**

### Built With

* SHELL

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* curl
```sh
sudo apt install curl 
```

### Installation

1. Download the script
```sh
curl https://raw.githubusercontent.com/sshamanov/pangaea-community/master/send_tx.sh -o send_tx.sh; chmod +x send_tx.sh
```

## Usage

1. Create new tmux session
```sh
tmux new -s pangaea_phaseII
```
2. Run the script
```sh
./send_tx.sh
```
3. Detach from tmux
```sh
Press: CTRL + B release and Press D
```

### you can adjust the following:
* ammount to send (0.00"$rand" as default)
* working directory (. cwd as default)
* desired time frame (10 seg as default)
